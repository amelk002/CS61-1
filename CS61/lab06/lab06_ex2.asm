;=================================================
; Name: Xiao Zhou
; Username: xzhou016
; 
; Lab: lab 6
; Lab section: 24	  
; TA: Jose Rodriguez
; 
;=================================================
.ORIG x3000

LEA R0, intro
PUTS

;get input
GETC
OUT

JSR BinCount

LEA R0, OUTPUT
PUTS
LD R0, ASCII
ADD R0, R1, R0
OUT

HALT


;x3000 data
intro 	.STRINGZ	"Input a character followed by ENTER\n"
OUTPUT	.STRINGZ 	"\n# of 1's in your character : "
ASCII	.FILL 	#48
; BinCount	.FILL x4000

;=======================================================================
; Subroutine: BinCount
; Parameter : R0
; Postcondition: add input up and combine into a single decimal value +1 
; Return Value: 16-bit  R2

.orig x3200
;=======================================================================
;========================
; Subroutine Instructions
;========================
BinCount
ST R7, R7_x3200 ;backup whatever was in R7
LD R2, counter	;loop counter
AND R1, R1, #0


One_Loop
ADD R0, R0, #0 ;Check if the bit is one or zero
BRp NOT_ONE
ADD R1, R1, #1
NOT_ONE
ADD R0, R0, R0 ;shift by 1
ADD R2, R2, #-1 ;decrement loop
BRp One_Loop

LD R7, R7_x3200

RET
;===============
;.ORIG x4000 data
;================

R7_x3200	.BLKW #1
counter		.FILL #16

