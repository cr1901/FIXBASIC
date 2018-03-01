#ifndef HANDLERS_H_
#define HANDLERS_H_
#pragma once

// Headers required by this file
#include <stdint.h>
#include "tsrplex.h"

#define NUMBER_OF_TSR_HOOKS					3
#define TSR_IDENTIFICATION_STRING_LENGTH	12
#define TSR_IDENTIFICATION_STRING			"OpenWatclock"
#define SYSTEM_TIMER_TICK_INTERRUPT_1C		0x1C
#define DOS_IDLE_INTERRUPT_28h				0x28
#define DOS_TSR_MULTIPLEX_INTERRUPT_2F		0x2F

#define TICKS_BEFORE_DRAWING_THE_CLOCK		18	// 18 * 55ms = 1 second
#define COLUMNS_ON_SCREEN					80
#define COLUMNS_ON_CLOCK					5

typedef struct ResidentData
{
	__segment			pspSegment;
	volatile uint8_t	tickCounter;
	uint8_t				tsrID;
	char				tsrIdString[TSR_IDENTIFICATION_STRING_LENGTH];
	TSR_HOOK			tsrHooks[NUMBER_OF_TSR_HOOKS];
} RESIDENT_DATA;

enum TsrHooks
{
	SYSTEM_TIMER_TICK_1Ch,
	DOS_IDLE_28h,
	DOS_TSR_MULTIPLEX_2Fh
};


//********//
//* Data *//
//********//

extern RESIDENT_DATA	g_residentData;


//*************//
//* Functions *//
//*************//

extern void SetCursorToClockLocation(void);
extern uint16_t GetSizeOfResidentSegmentInParagraphs(void);


#endif /* HANDLERS_H_ */
