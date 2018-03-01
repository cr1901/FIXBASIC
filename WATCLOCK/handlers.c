#include <stdbool.h>
#include <dos.h>
#include "handlers.h"
#include "tsrresic.h"
#include "biosndos.h"

// All data and code here goes to the resident BEGTEXT code segment
#pragma data_seg("BEGTEXT", "CODE");
#pragma code_seg("BEGTEXT", "CODE");


// Function prototypes
static void __interrupt SystemTimerTickAtVector1Ch(union INTPACK registers);

static void __interrupt DosIdleAtVector28h(union INTPACK registers);
static inline bool TimeToDrawClock(void);
static void PrintSystemTime(void);
static inline void PrintDosTimeToCurrentCursorLocation(DOS_TIME dosTime);
static void PrintByteAsDecimalInteger(uint8_t byte);
static inline void PrintTickingCharacter(bool timeToPrintCharacter);

static void __interrupt DosTsrMultiplexAtVector2Fh(union INTPACK registers);
static inline bool OurHandlerWasCalled(uint8_t tsrID);


//********//
//* Data *//
//********//

RESIDENT_DATA	g_residentData =
{
		0,							// RESIDENT_DATA.pspSegment
		0,							// .tickCounter
		0,							// .tsrID
		TSR_IDENTIFICATION_STRING,	// .tsrIdString[]
		{							// .tsrHooks[]
			{ 0, (INTERRUPT_HANDLER_OFFSET)SystemTimerTickAtVector1Ch, SYSTEM_TIMER_TICK_INTERRUPT_1C, 0 },
			{ 0, (INTERRUPT_HANDLER_OFFSET)DosIdleAtVector28h, DOS_IDLE_INTERRUPT_28h, 0 },
			{ 0, (INTERRUPT_HANDLER_OFFSET)DosTsrMultiplexAtVector2Fh, DOS_TSR_MULTIPLEX_INTERRUPT_2F, 0 }
		}
};


//***********************************//
//* System Timer Tick Interrupt 1Ch *//
//***********************************//

static void __interrupt SystemTimerTickAtVector1Ch(union INTPACK registers)
{
	LoadCodeSegmentToDataSegment();
	g_residentData.tickCounter++;

	// Cannot use _chain_intr() because it is part of the libraries that
	// were removed from memory when we called _dos_keep().
	// TsrResiC_JumpToInterruptHandler() must be at the end of ISR function!
	TsrResiC_JumpToInterruptHandler(g_residentData.tsrHooks[SYSTEM_TIMER_TICK_1Ch].previousHandler);
}


//**************************//
//* DOS Idle Interrupt 28h *//
//**************************//

static void __interrupt DosIdleAtVector28h(union INTPACK registers)
{
	LoadCodeSegmentToDataSegment();
	if ( TimeToDrawClock() )
		PrintSystemTime();

	TsrResiC_JumpToInterruptHandler(g_residentData.tsrHooks[DOS_IDLE_28h].previousHandler);
}

static inline bool TimeToDrawClock(void)
{
	return (g_residentData.tickCounter % TICKS_BEFORE_DRAWING_THE_CLOCK) == 0;
}

static void PrintSystemTime(void)
{
	uint16_t	initialCursorLocation;
	DOS_TIME	dosTime;

	initialCursorLocation	= GetCursorCoordinates();
	dosTime					= GetDosTime();
	SetCursorToClockLocation();
	PrintDosTimeToCurrentCursorLocation(dosTime);
	SetCursorCoordinates(initialCursorLocation);
}

void SetCursorToClockLocation(void)
{
	SetCursorCoordinates(COLUMNS_ON_SCREEN - COLUMNS_ON_CLOCK);
}

static inline void PrintDosTimeToCurrentCursorLocation(DOS_TIME dosTime)
{
	PrintByteAsDecimalInteger(dosTime.hour);
	PrintTickingCharacter(dosTime.second & 1);
	PrintByteAsDecimalInteger(dosTime.minute);
}

static void PrintByteAsDecimalInteger(uint8_t byte)
{
	uint8_t		tenths;
	uint8_t		ones;

	// Cannot use div() from <stdlib.h> since it generates
	// function call to the libraries that are no longer loaded
	tenths	= byte / 10;
	ones	= byte % 10;

	PrintCharacterWithTeletypeOutput(tenths + '0');
	PrintCharacterWithTeletypeOutput(ones + '0');
}

static inline void PrintTickingCharacter(bool timeToPrintCharacter)
{
	char	tickChar;

	tickChar	= (timeToPrintCharacter) ? ':' : ' ';
	PrintCharacterWithTeletypeOutput(tickChar);
}


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
