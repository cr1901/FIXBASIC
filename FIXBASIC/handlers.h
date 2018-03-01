#ifndef HANDLERS_H_
#define HANDLERS_H_
#pragma once

// Headers required by this file
#include <stdint.h>
#include "tsrplex.h"

#define NUMBER_OF_TSR_HOOKS					2
/* Shouldn't be less than 11 characters (plus NULL).
 * Don't get too hung up with optimization...
 * Using partial C is cheating anyway :D! */
#define TSR_IDENTIFICATION_STRING_LENGTH	12
#define TSR_IDENTIFICATION_STRING			"FIXBASIC"
#define SYSTEM_SERVICES_INTERRUPT_15H		0x15
#define SYSTEM_TIMER_TICK_INTERRUPT_1C		0x1C
#define DOS_INTERRUPT_21h					0x21
#define DOS_IDLE_INTERRUPT_28h				0x28
#define DOS_TSR_MULTIPLEX_INTERRUPT_2F		0x2F

#define IN_DOS_FLAG_SERVICE 0x34

typedef struct ResidentData
{
	__segment			pspSegment;
	uint8_t				tsrID;
	char				tsrIdString[TSR_IDENTIFICATION_STRING_LENGTH];
	TSR_HOOK			tsrHooks[NUMBER_OF_TSR_HOOKS];
} RESIDENT_DATA;

enum TsrHooks
{
	SYSTEM_SERVICES_15H,
	DOS_TSR_MULTIPLEX_2Fh
};


//********//
//* Data *//
//********//

extern RESIDENT_DATA	g_residentData;


//*************//
//* Functions *//
//*************//

extern uint16_t GetSizeOfResidentSegmentInParagraphs(void);


#endif /* HANDLERS_H_ */
