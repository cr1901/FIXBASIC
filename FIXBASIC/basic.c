#include "basic.h"

/* The following code serves as an area to place IBM ROMBASIC in the exe.
 * Just follow the directions of the text string!
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

#pragma data_seg("BEGTEXT", "CODE");
char BASIC[800]= "IBM ROM BASIC GOES IN THE 800 BYTES ALLOCATED. \
THIS PROVIDES THE FIX REQUIRED TO GET QBASIC/EDIT ON PCDOS 5.0 TO LAUNCH. USE \
A HEX EDITOR'S COPY FUNCTION TO COPY ROM BASIC TO THE REQUIRED LOCATION. \
A COPY OF THE FIRST 800 BYTES OF IBM ROMBASIC IS PROVIDED IN THE FILE 'BASIC8.BIN'\
IN THE 'BIN' DIRECTORY.";
