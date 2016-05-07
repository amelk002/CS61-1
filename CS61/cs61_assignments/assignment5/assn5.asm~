;=================================================
; Name: Xiao Zhou
; Email: xzhou016@ucr.edu
; 
; Assignment name: Assignment 5
; Lab section: 21
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
LD R6, GET_INPUT
JSRR R6

  ADD R5, R5, #0
  BRp NO_INVERT
  AND R1, R1, #0
  ADD R1, R1, #-1
  ST R1, SIGN_1
  NOT R5, R5
  ADD R5, R5, #1

NO_INVERT
LD R1, INPUT_1_PTR_3000
STR R5, R1, #0


;====================================
;FIX NEGATIVE FLAG SET BY FIRST THING
;====================================
AND R6, R6,#0
LD R5, FLAG_PTR
STR R6, R5, #0

;===============
;SECOND VALUE INPUT
;================
LD R6, GET_INPUT
JSRR R6


  ADD R5, R5, #0
  BRp NO_INVERT_2
  AND R1, R1, #0
  ADD R1, R1, #-1
  ST R1, SIGN_2
  NOT R5, R5
  ADD R5, R5, #1

NO_INVERT_2
LD R1, INPUT_2_PTR_3000
STR R5, R1, #0 


;================
;MULTIPLICATION
;==============
LD R6, MUL_INPUT
JSRR R6
ST R2, OVERFLOW_VALUE

LD R1, FINAL_ANSWER_PTR
STR R0, R1, #0


;=================
;DISPLAY
;=================
  LD R1, INPUT_1_PTR_3000
  AND R0, R0, #0
  LDR R0, R1, #0
  LD R1, SIGN_1
  ADD R1, R1, #0
  BRz SKIP_TWO_COMP
  NOT R0, R0
  ADD R0, R0, #1
  
  SKIP_TWO_COMP
  LD R6, OUTPUT
  JSRR R6

LEA R0, TIMES
PUTS

  LD R1, INPUT_2_PTR_3000
  AND R0, R0, #0
  LDR R0, R1, #0

  LD R1, SIGN_2
  ADD R1, R1, #0
  BRz SKIP_TWO_COMP_AGAIN
  NOT R0, R0
  ADD R0, R0, #1
  
  SKIP_TWO_COMP_AGAIN
  LD R6, OUTPUT
  JSRR R6

LEA R0, EQUALS
PUTS
  ADD R6, R6, #0
  BRn DOES_OVERFLOW
  LD R1, FINAL_ANSWER_PTR
  AND R0, R0, #0
  LDR R0, R1, #0


  LD R1, SIGN_1
  LD R2, SIGN_2
  ADD R2, R1, R2	;CHECK IF ANSWER IS 
  BRz POSITIVE
    NOT R0, R0
    ADD R0, R0, #1
  POSITIVE
  LD R6, OUTPUT
  JSRR R6

HALT

DOES_OVERFLOW
  LEA R0, OVERFLOW
  PUTS
HALT
;---------------	
;Data
;---------------
TIMES .STRINGZ " * "
EQUALS .STRINGZ " = "
OVERFLOW .STRINGZ "Overflow!"
GET_INPUT	.FILL x3200
MUL_INPUT	.FILL x3400
OUTPUT		.FILL x3800
INPUT_1_PTR_3000	.FILL	x6200
INPUT_2_PTR_3000	.FILL	x6300
FINAL_ANSWER_PTR	.FILL	x6400
OVERFLOW_VALUE		.FILL	#0
SIGN_1			.FILL	#0
SIGN_2			.FILL	#0
FLAG_PTR		.FILL	x324C



;------------
;Remote data
;------------
;=======================================================================
; Subroutine: GET_INPUT
; Parameter : null
; Postcondition: get binary input from user, add to R2, then do conversion
; Return Value: 16-bit  R5

.ORIG x3200
;=======================================================================
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
    ADD R3, R3, -x1	;DECREMENT LOOP

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
  ADD R3, R3, #0	;DECREMENT LOOP

  
  BRp GET_NUM

  LD R0, NEWLINE	;PRINT NEWLINE
  OUT
  BR TWO_COMPLIMENT

;====================
;TURN NUMBER NEGATIVE
;====================
TWO_COM_FLAG
  
  ADD R6, R3, #-4 	;CHECK IF COUNTER IS LESS THAN 5
  BRn NEED_NEWLINE

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
  BRz CHECK_LOOP_LESS_THAN_5
  CHECK_IF_ENTER
    ADD R6, R3, #-5 	;CHECK IF COUNTER IS LESS THAN 5
    BRz ENTER_ERROR
    LD R2, HEX_ENTER
    ADD R2, R2, R0
  BRz TWO_COMPLIMENT
  BR END_PROGRAM
  
  CHECK_LOOP_LESS_THAN_5
    ADD R6, R3, #-5 	;CHECK IF COUNTER IS LESS THAN 5
    BRn NEED_NEWLINE
  BR GET_NUM
  
  NEED_NEWLINE
  ;Example of how to Output Error Message
  LD R0, NEWLINE
  OUT
  ENTER_ERROR
  LD R0, errorMessage  ;Output Error Message
  PUTS
BR GENERAL_INPUT_LOOP

END_PROGRAM
LD R7, BACKUP_R7_3200

RET


;HINT Restore

;Data for subroutine
introMessage .FILL x6000
errorMessage .FILL x6100
HEX_ZERO	.FILL	-x30
HEX_NINE	.FILL	-x39
HEX_MINUS	.FILL	-x2D
HEX_PLUS	.FILL	-x2B
HEX_ENTER	.FILL	-#10
FLAG		.FILL 	x0
NEWLINE		.FILL	#10
COUNTER		.FILL 	#6
BACKUP_R7_3200	.BLKW #1


;-------------------
; Subroutine to multiply two numbers help in Register x and Register y and store result
; into Register z
;-------------------
.ORIG x3400
;HINT back up 
ST R7, R7_BACKUP_3400

LOAD_FIRST
  LD R5, INPUT_1_PTR_3400
  AND R1, R1, #0
  LDR R1, R5, #0

LOAD_NEXT
  LD R6, INPUT_2_PTR_3400
  AND R2, R2, #0
  LDR R2, R6, #0
 

NOT R2, R2
ADD R2, R2, #1

SKIP_NOT
  ADD R3, R1, R2
  BRnz LOAD_SEC_VALUE

LOAD_FIS_VALUE
  LDR R1, R5, #0
  LDR R2, R6, #0
BR MUL_LOOP_CLEAR_R0

LOAD_SEC_VALUE
  LDR R1, R6, #0
  LDR R2, R5, #0

MUL_LOOP_CLEAR_R0
  AND R0, R0, #0

MUL_LOOP
  ADD R0, R0, R1
  BRn WILL_OVERFLOW
  ADD R2, R2, #-1
  BRp MUL_LOOP
MUL_LOOP_END

LD R7, R7_BACKUP_3400

RET

WILL_OVERFLOW
AND R3, R3, #0
ADD R3, R3, #-1
BR MUL_LOOP_END 

;Data for subroutine
INPUT_1_PTR_3400	.FILL	x6200
INPUT_2_PTR_3400	.FILL	x6300
  ;LOCAL VALUE BACKUP
  INPUT_1_3400		.FILL x0
  INPUT_2_3400		.FILL x0
R7_BACKUP_3400 	.BLKW #1

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
ADD R4, R4, #0
BRz SKIP_LEADING_0_TWO

OP_LOOP_ONE_HUNDRED
	LD R0, HEX_ZERO_3800
	ADD  R0, R4 ,R0
	OUT
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
ADD R4, R4, #0
BRz SKIP_LEADING_0_THREE

OP_LOOP_TEN
	LD R0, HEX_ZERO_3800
	ADD  R0, R4 ,R0
	OUT
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
ADD R4, R4, #0
BRz SKIP_LEADING_0_FOUR
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



.ORIG x6000
;---------------
;messages
;---------------
intro .STRINGZ	"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"
;---------------
;error_messages
;---------------
.ORIG x6100	
error_mes .STRINGZ	"ERROR INVALID INPUT\n"

.ORIG x6200
INPUT_1		.FILL #0
.ORIG x6300
INPUT_2		.FILL #0
.ORIG x6400
FINAL_ANSWER	.FILL #0

;---------------
;END of PROGRAM
;---------------
.END
;-------------------
;PURPOSE of PROGRAM
;-------------------
