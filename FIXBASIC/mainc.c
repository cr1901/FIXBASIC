#include <stdbool.h>
#include <stdio.h>
#include <dos.h>
#include "handlers.h"

static void PrintTitleString(void);

static void GetInDosFlagAddress(RESIDENT_DATA far * pResidentData);

static RESIDENT_DATA far* GetFarPointerToResidentData(void);
static TSR_ERROR FindLoadedInstanceOrNewID(RESIDENT_DATA far* pResidentData);
static inline bool PreviousInstanceFound(TSR_ERROR tsrError);
static inline bool NoTsrErrors(TSR_ERROR tsrError);

static TSR_ERROR InstallTsrToMemory(RESIDENT_DATA far* pResidentData);
static void ReturnToDosWithResidentSegmentInRAM(void);

static TSR_ERROR RemoveTsrFromMemory(uint16_t tsrID);
static RESIDENT_DATA far* GetResidentDataFromLoadedInstance(MULTIPLEX_IO* pMultiplexIO);
static void UnchainInterruptHandlers(MULTIPLEX_IO* pMultiplexIO, const RESIDENT_DATA far* pResidentDataInRam);
static TSR_ERROR UnloadLoadedInstanceFromMemory(__segment pspSegment);

static void PrintTsrError(TSR_ERROR tsrError);
static char* GetTsrErrorString(TSR_ERROR tsrError);


#define ReturnIfTsrError(tsrError)	\
	if ( (tsrError) != NO_ERROR )	\
		return (tsrError)


int main(void)
{
	RESIDENT_DATA far*	pResidentData;
	TSR_ERROR			tsrError;
	
	PrintTitleString();
	
	/* Set up data structures. */
	pResidentData	= GetFarPointerToResidentData();
	tsrError		= FindLoadedInstanceOrNewID(pResidentData);
	
	/* Attempt to uninstall if already installed. */
	if ( PreviousInstanceFound(tsrError) )
	{
		printf("Previous instance found with ID %Xh.\nRemoving from memory... ", pResidentData->tsrID);
		tsrError	= RemoveTsrFromMemory(pResidentData->tsrID);
		if ( NoTsrErrors(tsrError) )
		{
			//RemoveStoppedClockFromScreen();
			puts("Done.");
		}
	}
	
	/* Otherwise, attempt to install. */
	else if ( NoTsrErrors(tsrError) )
	{
		tsrError	= InstallTsrToMemory(pResidentData);
		if ( NoTsrErrors(tsrError) )
			ReturnToDosWithResidentSegmentInRAM();
	}
	
	/* Get results. */
	PrintTsrError(tsrError);
	return tsrError;
}

static void PrintTitleString(void)
{
	puts("FIXBASIC (C) 2012 William D. Jones\n"
		 "TSR functionality (C) 2011 Tomi Tilli.\n"
		 /* "The purpose for this program is to demonstrate how to write TSR applications\n"
		 "with Open Watcom (1.9) so that resident part of the program does not\n"
		 "contain C libraries.\n" */);
}

/* Debug function. Not necessary in the current code. */

/* static void GetInDosFlagAddress(RESIDENT_DATA far * pResidentData)
{
	uint8_t far * inDos = 0; /* Alias to desired variable. */
	/* x86 is little endian, so the pointer is stored in memory
	 * as OFFSET;SEGMENT. */
	/* __asm{
			mov ah, IN_DOS_FLAG_SERVICE
			int DOS_INTERRUPT_21h
			mov word ptr inDos[0], bx
			mov word ptr inDos[2], es
		}
		printf("InDOS Flag: %Fp\n", inDos);
		pResidentData->inDosFlag = inDos;
} */


static RESIDENT_DATA far* GetFarPointerToResidentData(void)
{
	__segment	codeSegment;

	codeSegment	= GetCodeSegment();
	return codeSegment:>&g_residentData;
}

static TSR_ERROR FindLoadedInstanceOrNewID(RESIDENT_DATA far* pResidentData)
{
	MULTIPLEX_SEARCH	multiplexSearch;

	multiplexSearch.inFarIdString	= FP_SEG(pResidentData):>pResidentData->tsrIdString;
	//printf("String is at: %Fp.\n The string is: %s\n", FP_SEG(pResidentData):>pResidentData, multiplexSearch.inFarIdString);
	TsrPlex_FindMultiplexID(&multiplexSearch);
	pResidentData->tsrID			= multiplexSearch.outID;
	return multiplexSearch.outError;
}

static inline bool PreviousInstanceFound(TSR_ERROR tsrError)
{
	return tsrError == ANOTHER_INSTANCE_OF_OUR_TSR_LOADED;
}

static inline bool NoTsrErrors(TSR_ERROR tsrError)
{
	return tsrError == NO_ERROR;
}


static TSR_ERROR InstallTsrToMemory(RESIDENT_DATA far* pResidentData)
{
	TSR_ERROR	tsrError;

	pResidentData->pspSegment	= TsrPlex_GetCurrentPspSegment();

	tsrError	= TsrPlex_InstallTsrHooks(FP_SEG(pResidentData):>pResidentData->tsrHooks, NUMBER_OF_TSR_HOOKS);
	ReturnIfTsrError(tsrError);

	tsrError	= TsrPlex_FreeEnvironmentalBlockFromPSP(pResidentData->pspSegment);
	PrintTsrError(tsrError);
	return NO_ERROR;	// Do not quit, just leave 256 byte environmental block in RAM
}

static void ReturnToDosWithResidentSegmentInRAM(void)
{
	uint16_t	paragraphsToKeepInRAM;

	paragraphsToKeepInRAM	= GetSizeOfResidentSegmentInParagraphs();
	printf("TSR loaded in RAM with %u bytes used.\n", paragraphsToKeepInRAM<<4);
	puts("Run this program again to remove TSR from memory.");
	flushall();		// Flush all streams before returning to DOS
	_dos_keep(0, paragraphsToKeepInRAM);
}


static TSR_ERROR RemoveTsrFromMemory(uint16_t tsrID)
{
	RESIDENT_DATA far*	pResidentDataInRam;
	MULTIPLEX_IO		multiplexIO;

	multiplexIO.inTsrID	= tsrID;
	pResidentDataInRam	= GetResidentDataFromLoadedInstance(&multiplexIO);
	ReturnIfTsrError(multiplexIO.outTsrError);

	UnchainInterruptHandlers(&multiplexIO, pResidentDataInRam);
	ReturnIfTsrError(multiplexIO.outTsrError);

	return UnloadLoadedInstanceFromMemory(pResidentDataInRam->pspSegment);
}

static RESIDENT_DATA far* GetResidentDataFromLoadedInstance(MULTIPLEX_IO* pMultiplexIO)
{
	pMultiplexIO->inFunction = GET_RESIDENT_DATA_AND_PREPARE_FOR_UNLOAD;
	TsrPlex_MultiplexCall(pMultiplexIO);
	return (RESIDENT_DATA far*) pMultiplexIO->ioPtrParam;
}

static void UnchainInterruptHandlers(MULTIPLEX_IO* pMultiplexIO, const RESIDENT_DATA far* pResidentDataInRam)
{
	pMultiplexIO->outTsrError = TsrPlex_UninstallTsrHooks(
			FP_SEG(pResidentDataInRam):>pResidentDataInRam->tsrHooks, NUMBER_OF_TSR_HOOKS);
}

static TSR_ERROR UnloadLoadedInstanceFromMemory(__segment pspSegment)
{
	// Call TsrPlex_FreeEnvironmentalBlockFromPSP() here if it has not
	// been freed earlier.
	/**/

	return TsrPlex_FreePspToRemoveTsrFromMemory(pspSegment);
}

static void PrintTsrError(TSR_ERROR tsrError)
{
	if ( tsrError != NO_ERROR )
	{
		printf("Error occurred!\nError code: %Xh, Error description: %s\n",
			tsrError, GetTsrErrorString(tsrError));
	}
}

static char* GetTsrErrorString(TSR_ERROR tsrError)
{
	switch ( tsrError )
	{
	case NO_ERROR:
		return "NO_ERROR";
	case ANOTHER_INSTANCE_OF_OUR_TSR_LOADED:
		return "ANOTHER_INSTANCE_OF_OUR_TSR_LOADED";
	case NO_FREE_ID_AVAILABLE:
		return "NO_FREE_ID_AVAILABLE";
	case TSR_HOOK_ALREADY_INSTALLED:
		return "TSR_HOOK_ALREADY_INSTALLED";
	case TSR_HOOK_NOT_INSTALLED:
		return "TSR_HOOK_NOT_INSTALLED";
	case TSR_HOOK_NO_LONGER_ON_TOP_OF_CHAIN:
		return "TSR_HOOK_NO_LONGER_ON_TOP_OF_CHAIN";
	case UNKNOWN_MULTIPLEX_FUNCTION:
		return "UNKNOWN_MULTIPLEX_FUNCTION";
	case FAILED_TO_FREE_MEMORY:
		return "FAILED_TO_FREE_MEMORY";
	default:
		return "Unknown Error";
	}
}
