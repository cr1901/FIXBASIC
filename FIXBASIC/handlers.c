#include <stdbool.h>
#include <dos.h>
#include <stdio.h>
#include "handlers.h"
#include "tsrresic.h"
#include "basic.h"

// All data and code here goes to the resident BEGTEXT code segment
#pragma data_seg("BEGTEXT", "CODE");
#pragma code_seg("BEGTEXT", "CODE");

// Function prototypes
static void __interrupt SystemServicesAtVector15h(union INTPACK registers);
static void __interrupt DosTsrMultiplexAtVector2Fh(union INTPACK registers);
static inline bool OurHandlerWasCalled(uint8_t tsrID);


//********//
//* Data *//
//********//

RESIDENT_DATA	g_residentData =
{
		0,							// RESIDENT_DATA.pspSegment
		0,							// .tsrID
		TSR_IDENTIFICATION_STRING,	// .tsrIdString[]
		{							// .tsrHooks[]
			{ 0, (INTERRUPT_HANDLER_OFFSET)SystemServicesAtVector15h, SYSTEM_SERVICES_INTERRUPT_15H, 0 },
			{ 0, (INTERRUPT_HANDLER_OFFSET)DosTsrMultiplexAtVector2Fh, DOS_TSR_MULTIPLEX_INTERRUPT_2F, 0 }
		}
};

static void __interrupt SystemServicesAtVector15h(union INTPACK registers)
{
	LoadCodeSegmentToDataSegment();
	if(registers.h.ah==0x22)
	{
		/* The following code serves as a patch for int 15, subfunction 22 (find ROMBASIC memory location).
		 * For the purposes of fixing QBASIC, ROMBASIC must be at the beginning of the code/data segment, 
		 * as QBASIC PCDOS 5.0 assumes that ROMBASIC begins at offset 0, regardless of the returned segment:
		 * 
		 * From offset 0x14141 in the binary (use DOSBOX-Debug or IDA):
		 * 
		 * mov ah, 22
		 * int 15h
		 * mov ax, es
		 * ...
		 * mov ds, ax
		 * xor si, si ;Here!
		 * lodsw
		 * ...
		 * ;xor QBASIC with ax  
		 * 
		 * The offset is also returned for completeness, in case other programs suffer from this bug. 
		 * Source: http://www.os2museum.com/wp/?p=726&cpage=1#comment-3562 */
		registers.w.bx=FP_OFF(&(BASIC));
		registers.w.es=FP_SEG(&(BASIC));
	}
	else /* Service int 15h normally. */
	{
		TsrResiC_JumpToInterruptHandler(g_residentData.tsrHooks[SYSTEM_SERVICES_15H].previousHandler);
	}
}

/* Below code kept for my reference- does NOT have any effect on
 * the current application. */

//***********************************//
//* DOS TSR Multiplex Interrupt 2Fh *//
//***********************************//

static void __interrupt DosTsrMultiplexAtVector2Fh(union INTPACK registers)
{
	LoadCodeSegmentToDataSegment();
	if ( OurHandlerWasCalled(registers.h.ah) )
	{
		switch ( (MULTIPLEX_FUNCTION) registers.h.al )
		{
		case INSTALLATION_CHECK:
			registers.w.di	= (uint16_t) g_residentData.tsrIdString;
			registers.w.es	= GetCodeSegment();
			registers.h.al	= 0xFF;			// TSR installed
			return;

		case GET_RESIDENT_DATA_AND_PREPARE_FOR_UNLOAD:
			registers.w.di	= (uint16_t) &g_residentData;
			registers.w.es	= GetCodeSegment();
			registers.h.al	= NO_ERROR;
			return;

		default:
			registers.h.al	= UNKNOWN_MULTIPLEX_FUNCTION;
			return;
		}
	}
	else TsrResiC_JumpToInterruptHandler(g_residentData.tsrHooks[DOS_TSR_MULTIPLEX_2Fh].previousHandler);
}

static inline bool OurHandlerWasCalled(uint8_t tsrID)
{
	return g_residentData.tsrID == tsrID;
}


//**************************//
//* End of BEGTEXT segment *//
//**************************//

/**
 * This function must the the last one in the BEGTEXT segment!
 *
 * GetSizeOfResidentSegment() must locate after all other resident functions and global variables.
 * This function must be defined in the last source file if there are more than
 * one source file containing resident functions.
 */
uint16_t GetSizeOfResidentSegmentInParagraphs(void)
{
	uint16_t	sizeInBytes;

	sizeInBytes	= (uint16_t) GetSizeOfResidentSegmentInParagraphs;
	sizeInBytes	+= 0x100;	// Size of PSP (do not add when building .COM executable)
	sizeInBytes	+= 15;		// Make sure nothing gets lost in partial paragraph

	return sizeInBytes >> 4;
}
