;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 6
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.ORIG x3000

LEA R0, INTRO
PUTS

GETC
OUT 

LD R6, NUM_BIN
JSRR R6

LEA R0, OUTRO
PUTS

LD R0, HEX_ZERO
ADD R0, R0, R1
OUT

HALT


;==============
;X3000 DATA
;==============
INTRO		.STRINGZ "\nEnter a character\n"
OUTRO		.STRINGZ "\nYour thingamabob has this many 1's: "
NUM_BIN		.FILL x3200
HEX_ZERO	.FILL x30



;=======================================================================
; Subroutine: DISPLAY BINARY COUNT
; Parameter : R0
; Postcondition: find the number of binary in R0
; Return Value: R2

;=======================================================================
.ORIG x3200

ST R7, R7_BACKUP_3200
AND R1, R1, #0

BEGIN_COUNT
ADD R0, R0, R0 
BRn SKIP_COUNT
ADD R1, R1, #1
SKIP_COUNT
BRnp BEGIN_COUNT


LD R7, R7_BACKUP_3200

RET


;==========
;X3200 DATA
;==========
R7_BACKUP_3200		.BLKW #1



