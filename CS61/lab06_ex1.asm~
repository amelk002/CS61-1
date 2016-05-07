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

LD R6, INPUT
JSRR R6

AND R0, R0, #0
ADD R0, R0, R5

LD R6, ADD_NUM
JSRR R6



HALT
;===========
;x3000 DATA
;===========
INPUT		.FILL x3200
ADD_NUM		.FILL x3800


;=======================================================================
; Subroutine: BINARY_READ
; Parameter : null
; Postcondition: get binary input from user, add to R2, then do conversion
; Return Value: 16-bit  R5

.ORIG x3200
;=======================================================================
;========================
; Subroutine Instructions
;========================

ST R7, BACKUP_R7_3200

GENERAL_INPUT_LOOP
  ;Example of how to Output Intro Message
  LD R0, introMessage  ;Output Intro Message
  PUTS

INPUT_LOOP
  ;=============
  ;CLEAR REG
  ;=============
  AND R6, R6, #0
  AND R5, R5, #0		;R5 -> 0
  AND R4, R4, #0
  AND R3, R3, #0
  AND R2, R2, #0
  AND R1, R1, #0
  AND R0, R0, #0
  
  LD R3, COUNTER

GET_NUM
  ;========
  ;INPUT
  ;========
  GETC 
  OUT


  ;==========================
  ;CHECK IF INPUT IS IN RANGE
  ;==========================
  CHECK_IF_NUM
  CHECK_LESS_THAN_ZERO
    LD R2, HEX_ZERO
    ADD R2, R2, R0
  BRn ERROR_LOOP
  
  CHECK_GREATER_THAN_NINE
    LD R2, HEX_NINE
    ADD R2, R2, R0
  BRp ERROR_LOOP
  
  INCREMENT_LOOP
    ADD R4, R5, x0

    ADD R4, R4, R4
    ADD R5, R5, R5
    ADD R5, R5, R5
    ADD R5, R5, R5
    
    ADD R5, R4, R5
    AND R4, R4, x0



  LD R6, HEX_ZERO
  ADD R0, R0, R6
  ADD R5, R5, R0 
  ADD R3, R3, -x1	;DECREMENT LOOP

  
  BRp GET_NUM

  LD R0, NEWLINE	;PRINT NEWLINE
  OUT
  BR TWO_COMPLIMENT

;====================
;TURN NUMBER NEGATIVE
;====================
TWO_COM_FLAG
  LD R2, FLAG
  ADD R2, R2, -x1
  ST R2, FLAG
BR GET_NUM

TWO_COMPLIMENT
  LD R2, FLAG
  ADD R2, R2, x0
BRzp END_PROGRAM
  NOT R5, R5
  ADD R5, R5, #1
BR END_PROGRAM



;==================
;CHECKING FOR ERROR
;==================
ERROR_LOOP

  ;===========================
  ;CHECK IF THE INPUT WAS SIGN
  ;===========================
  CHECK_IF_MINUS
    LD R2, HEX_MINUS
    ADD R2, R2, R0
  BRz TWO_COM_FLAG
  CHECK_IF_PLUS
    LD R2, HEX_PLUS
    ADD R2, R2, R0
  BRz GET_NUM
  CHECK_IF_ENTER
    LD R2, HEX_ENTER
    ADD R2, R2, R0
  BRz TWO_COMPLIMENT
    
  

  ;Example of how to Output Error Message
  LD R0, NEWLINE
  OUT
  LD R0, errorMessage  ;Output Error Message
  PUTS
BR GENERAL_INPUT_LOOP

END_PROGRAM
LD R7, BACKUP_R7_3200

RET
;---------------	
;Data
;---------------
HEX_ZERO	.FILL	-x30
HEX_NINE	.FILL	-x39
HEX_MINUS	.FILL	-x2D
HEX_PLUS	.FILL	-x2B
HEX_ENTER	.FILL	-#10
FLAG		.FILL 	x0
NEWLINE		.FILL	#10
COUNTER		.FILL 	#5

BACKUP_R7_3200	.BLKW #1

introMessage .FILL x6000
errorMessage .FILL x6100


.ORIG x3800
;-------------------
; Subroutine to ouput number in Register x
;-------------------
.ORIG x3800

;=======================================================================
; Subroutine: DISPLAY
; Parameter : R5
; Postcondition: add input up and combine into a single decimal value +1 
; Return Value: NULL

;=======================================================================
;========================
; Subroutine Instructions
;========================
ST R7, BACKUP_R7_3800
AND R4, R4, #0
AND R3, R3, #0
AND R5, R5, #0
ADD R5, R5, R0
BRz SKIP_LEADING_0_FOUR


AND R5, R5, #0
ADD R5, R5, R0
BRp IS_NOT_NEG

NOT R5, R5
ADD R5, R5, #1

LD R0, HEX_MINUS_3800
OUT
BR PRINTED_POS

IS_NOT_NEG
LD R0, HEX_PLUS_3800
OUT


PRINTED_POS

;================
;TEST R5 - 10000
;================
LD R0, TEN_THOUSAND
MINUS_TEN_THOUSAND
  ADD R5, R5, R0
BRn MINUS_ONE_THOUSAND
  ADD R4, R4, #1
BR MINUS_TEN_THOUSAND

;================
;TEST R5 - 1000
;================
MINUS_ONE_THOUSAND
LD R0, RESTORE_TEN_THOUSAND
ADD R5, R5, R0
ADD R4, R4, #0
BRz SKIP_LEADING_0_ONE

OP_LOOP_ONE_THOUSAND
	LD R0, HEX_ZERO_3800
	ADD  R0, R4 ,R0
	OUT
	ADD R3, R3, #1		;SET PRINTING PREVIOUS NUMBER TRUE
	AND R4, R4, #0		;CALEAR CONUNTER
	SKIP_LEADING_0_ONE
	LD R0, ONE_THOUSAND	;R0 = -1000
	ADD R5, R5, R0		;CHECK R5 > 1000
BRn MINUS_ONE_HUNDRED
	ADD R4, R4 , #1		;INCREMENT COUNTER BY 1
BR SKIP_LEADING_0_ONE	;GET BACK TO MINUS 1000 LOOP 
  
;================
;TEST R5 - 100
;================  
MINUS_ONE_HUNDRED
LD R0, RESTORE_ONE_THOUSAND
ADD R5, R5, R0
ADD R3, R3, #0
BRp OP_LOOP_ONE_HUNDRED
ADD R4, R4, #0
BRz SKIP_LEADING_0_TWO

OP_LOOP_ONE_HUNDRED
AND R3, R3, #0
	LD R0, HEX_ZERO_3800
	ADD  R0, R4 ,R0
	OUT
	ADD R3, R3, #1
	AND R4, R4, #0
	SKIP_LEADING_0_TWO
	LD R0, ONE_HUNDRED
	ADD R5, R5, R0
BRn MINUS_TEN
	ADD R4, R4, #1
BR SKIP_LEADING_0_TWO

;================
;TEST R5 - 10
;================ 
MINUS_TEN
LD R0, RESTORE_ONE_HUNDRED
ADD R5, R5, R0
ADD R3, R3, #0
BRp OP_LOOP_TEN
ADD R4, R4, #0
BRz SKIP_LEADING_0_THREE

OP_LOOP_TEN
AND R3, R3, #0
	LD R0, HEX_ZERO_3800
	ADD  R0, R4 ,R0
	OUT
	ADD R3, R3, #1
	AND R4, R4, #0
	SKIP_LEADING_0_THREE
	LD R0, TEN
	ADD R5, R5, R0
BRn FINAL_OUTPUT
	ADD R4, R4, #1
BR SKIP_LEADING_0_THREE

;================
;OUTPUT R5 REMAIN
;================ 
FINAL_OUTPUT
LD R0, RESTORE_TEN
ADD R5, R5, R0
ADD R3, R3, #0
BRp OP_LOOP_ONE
ADD R4, R4, #0
BRz SKIP_LEADING_0_FOUR

OP_LOOP_ONE
  LD R0, HEX_ZERO_3800
  ADD R0, R0, R4
  OUT

SKIP_LEADING_0_FOUR
LD R0, HEX_ZERO_3800
ADD R0, R0, R5
OUT

;LD R0, NEWLINE_3800
;OUT

LD R7, BACKUP_R7_3800
RET



;===============	
;Data
;===============
BACKUP_R7_3800		.BLKW #1
HEX_ZERO_3800		.FILL #48
HEX_MINUS_3800		.FILL x2D
HEX_PLUS_3800		.FILL x2B
TEN_THOUSAND		.FILL #-10000
ONE_THOUSAND		.FILL #-1000
ONE_HUNDRED		.FILL #-100
TEN			.FILL #-10
RESTORE_TEN_THOUSAND	.FILL #10000
RESTORE_ONE_THOUSAND	.FILL #1000
RESTORE_ONE_HUNDRED	.FILL #100
RESTORE_TEN		.FILL #10
COUNT	 		.FILL #0
NEWLINE_3800		.FILL	#10



.END


