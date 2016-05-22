;=================================================
; Name: Xiao Zhou
; Email: xzhou016@ucr.edu
; 
; Assignment name: Assignment 6
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
MENU_SELECTION 
    LD R6, MENU		;DISPLAY MENU
    JSRR R6

;===TEST TO SEE WHICH SUBROUTINE TO CALL ======
ADD R0, R1, -x1
BRz MENU_ONE
ADD R0, R1, -x2
BRz MENU_TWO
ADD R0, R1, -x3
BRz MENU_THREE
ADD R0, R1, -x4
BRz MENU_FOUR
ADD R0, R1, -x5
BRz MENU_FIVE
ADD R0, R1, -x6
BRz MENU_SIX
ADD R0, R1, -x7
BRz QUIT

;========MENU SELECT=============
MENU_ONE 	LD R6, ALL_MACHINES_BUSY
		JSRR R6
		LEA R0, NEWLINE_X3000
		PUTS
		ADD R2, R2, #0
		BRnp MENU_BUSY
		LEA R0, ALLNOTBUSY
		PUTS
		BR MENU_SELECTION
		MENU_BUSY	LEA R0, ALLBUSY
				PUTS
				BR MENU_SELECTION
MENU_TWO 	LD R6, ALL_MACHINES_FREE
		JSRR R6
		LEA R0, NEWLINE_X3000
		PUTS
		ADD R2, R2, #0
		BRnp MENU_FREE
		LEA R0, NOTFREE
		PUTS
		BR MENU_SELECTION
		MENU_FREE	LEA R0, FREE
				PUTS
				BR MENU_SELECTION
		
MENU_THREE 	LD R6, NUM_BUSY_MACHINES
		JSRR R6
		LEA R0, NEWLINE_X3000
		PUTS
		LEA R0, BUSYMACHINE1
		PUTS
		LD R6, print_number
		JSRR R6
		LEA R0, BUSYMACHINE2
		PUTS
BR MENU_SELECTION
MENU_FOUR 	LD R6, NUM_FREE_MACHINES
		JSRR R6
		LEA R0, NEWLINE_X3000
		PUTS
		LEA R0, FREEMACHINE1
		PUTS
		LD R6, print_number
		JSRR R6
		LEA R0, FREEMACHINE2
		PUTS
BR MENU_SELECTION
MENU_FIVE 	LD R6, Get_input
		JSRR R6
		AND R2, R2, #0
		ADD R2, R5, R2
		LEA R0, STATUS1
		PUTS
		LD R6, print_number
		JSRR R6
		LD R6, MACHINE_STATUS
		JSRR R6
		ADD R2, R2, #0
		BRz MENU_BUSY_STATUS
		LEA R0, STATUS3
		PUTS
		BR MENU_SELECTION
		MENU_BUSY_STATUS LEA R0, STATUS2
				 PUTS
BR MENU_SELECTION
MENU_SIX 	LD R6, FIRST_FREE
		JSRR R6
		LEA R0, NEWLINE_X3000
		PUTS
		ADD R2, R2, #0
		BRn MENU_NO_FREE
		LEA R0, FIRSTFREE
		PUTS
		LD R6, print_number
		JSRR R6
		LEA R0, NEWLINE_X3000
		PUTS
		BR MENU_SELECTION
		MENU_NO_FREE	LEA R0, FIRSTFREE3
				PUTS
BR MENU_SELECTION
    
QUIT
LEA R0, NEWLINE_X3000
PUTS
LEA R0, Goodbye
PUTS

HALT
;---------------	
;Data
;---------------
;Add address for subroutines
MENU			.FILL x3200
ALL_MACHINES_BUSY	.FILL x3400
ALL_MACHINES_FREE	.FILL x3600
NUM_BUSY_MACHINES	.FILL x3800
NUM_FREE_MACHINES	.FILL x4000
MACHINE_STATUS		.FILL x4200
FIRST_FREE		.FILL x4400
Get_input		.FILL x4600
print_number		.FILL x4800

;Other data 
NEWLINE_X3000 .STRINGZ "\n"
;Strings for options
Goodbye .Stringz "Goodbye!\n"
ALLNOTBUSY .Stringz "Not all machines are busy\n"
ALLBUSY .Stringz "All machines are busy\n"
FREE .STRINGZ "All machines are free\n"
NOTFREE .STRINGZ "Not all machines are free\n"
BUSYMACHINE1 .STRINGZ "There are "
BUSYMACHINE2 .STRINGZ " busy machines\n"
FREEMACHINE1 .STRINGZ "There are "
FREEMACHINE2 .STRINGZ " free machines\n"
STATUS1 .STRINGZ "Machine "
STATUS2  .STRINGZ " is busy\n"
STATUS3 .STRINGZ " is free\n"
FIRSTFREE .STRINGZ "The first available machine is number "
FIRSTFREE2 .STRINGZ "\n"
FIRSTFREE3 .STRINGZ "No machines are free\n"

.ORIG x3200
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MENU
; Inputs: None
; Postcondition: The subroutine has printed out a menu with numerical options, allowed the
;                          user to select an option, and returned the selected option.
; Return Value (R1): The option selected:  #1, #2, #3, #4, #5, #6 or #7
; no other return value is possible
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MENU
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X3200


INPUT_LOOP_X3200 LD R0, Menu_string_addr
		 PUTS

		 GETC
		 OUT

		 LD R1, HEX_ZERO_X3200
		 ADD R1, R1, R0
BRnz BAD_INPUT
		 LD R1, HEX_SEVEN_X3200
		 ADD R1, R1, R0
BRp BAD_INPUT


LD R1, HEX_ZERO_X3200		;GOOD INPUT, CONVERT TO DECIMAL AND RET
ADD R1, R1, R0
;HINT Restore
LD R7, R7_BACKUP_X3200
RET


BAD_INPUT LEA R0, NEWLINE_X3200
	  PUTS
	  LEA R0, Error_message_1
	  PUTS
BR INPUT_LOOP_X3200



;--------------------------------
;Data for subroutine MENU
;--------------------------------
Error_message_1 .STRINGZ "INVALID INPUT\n"
Menu_string_addr .FILL x6000
NEWLINE_X3200		.STRINGZ "\n"
R7_BACKUP_X3200		.BLKW #1
HEX_ZERO_X3200		.FILL -x30
HEX_SEVEN_X3200		.FILL -x37


.ORIG x3400
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_BUSY
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are busy
; Return value (R2): 1 if all machines are busy,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_BUSY
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X3400
AND R2, R2, #0

LDI R0, BUSYNESS_ADDR_ALL_MACHINES_BUSY
ADD R0, R0, #0
BRnp NOT_BUSY
ADD R2, R2, #1

NOT_BUSY
;HINT Restore7
LD R7, R7_BACKUP_X3400
RET
;--------------------------------
;Data for subroutine ALL_MACHINES_BUSY
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_BUSY .Fill xA000
R7_BACKUP_X3400			.BLKW #1


.ORIG x3600
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_FREE
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are free
; Return value (R2): 1 if all machines are free,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_FREE
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X3600
AND R2, R2, #0

LD R1, BUSYNESS_ADDR_ALL_MACHINES_FREE
LDR R0, R1, #0

ADD R1, R0, #1
BRz MACHINE_FREE
BR DONE_ALL_MACHINES_FREE
MACHINE_FREE
ADD R2, R2, #1

DONE_ALL_MACHINES_FREE
;HINT Restore
LD R7, R7_BACKUP_X3600
RET
;--------------------------------
;Data for subroutine ALL_MACHINES_FREE
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_FREE .Fill xA000
R7_BACKUP_X3600			.BLKW #1

.ORIG x3800
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_BUSY_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of busy machines.
; Return Value (R2): The number of machines that are busy
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_BUSY_MACHINES
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X3800

LDI R1, BUSYNESS_ADDR_NUM_BUSY_MACHINES
AND R2, R2, #0
LD R3,LOOP_COUNT

BUSY_MACHINES	ADD R1 ,R1,#0
		BRn NOT_BUSY_MACHINES
		ADD R2, R2, #1
NOT_BUSY_MACHINES	ADD R1, R1, R1
			ADD R3, R3, #-1
BRp BUSY_MACHINES

;HINT Restore
LD R7, R7_BACKUP_X3800
RET
;--------------------------------
;Data for subroutine NUM_BUSY_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_BUSY_MACHINES .Fill xA000
R7_BACKUP_X3800			.BLKW #1
LOOP_COUNT			.FILL #16


.ORIG x4000
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_FREE_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of free machines
; Return Value (R2): The number of machines that are free 
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_FREE_MACHINES
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X4000
LD R0, BUSYNESS_ADDR_NUM_FREE_MACHINES
LDR R1, R0, #0
AND R2, R2, 0
LD R3, LOOP_COUNT_X4000

FREE_MACHINES	ADD R1, R1, #0
		BRzp NOT_FREE_MACHINE
		ADD R2, R2, #1
NOT_FREE_MACHINE ADD R1, R1, R1
		 ADD R3, R3,#-1
BRp FREE_MACHINES
;HINT Restore
LD R7, R7_BACKUP_X4000
RET
;--------------------------------
;Data for subroutine NUM_FREE_MACHINES
;--------------------------------
BUSYNESS_ADDR_NUM_FREE_MACHINES .Fill xA000
R7_BACKUP_X4000		.BLKW #1
LOOP_COUNT_X4000	.FILL #16


.ORIG x4200
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MACHINE_STATUS
; Input (R1): Which machine to check
; Postcondition: The subroutine has returned a value indicating whether the machine indicated
;                          by (R1) is busy or not.
; Return Value (R2): 0 if machine (R1) is busy, 1 if it is free
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MACHINE_STATUS
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X4200
AND R3, R3, #0
AND R2, R2, #0

LDI R0, BUSYNESS_ADDR_MACHINE_STATUS	
ADD R3, R3, #1
APPLY_MASK	ADD R3, R3, R3
		ADD R1, R1, -x1
BRp APPLY_MASK

AND R3, R3, R0
BRz MACHINE_BUSY
ADD R2, R2, #1


MACHINE_BUSY
;HINT Restore
LD R7, R7_BACKUP_X4200
RET
;--------------------------------
;Data for subroutine MACHINE_STATUS
;--------------------------------
BUSYNESS_ADDR_MACHINE_STATUS.Fill xA000
R7_BACKUP_X4200		.BLKW #1

.ORIG x4400
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: FIRST_FREE
; Inputs: None
; Postcondition: 
; The subroutine has returned a value indicating the lowest numbered free machine
; Return Value (R2): the number of the free machine
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine FIRST_FREE
;--------------------------------
;HINT back up 
ST R7, R7_BACKUP_X4400
LDI R0, BUSYNESS_ADDR_FIRST_FREE
AND R1, R1, #0
AND R2, R2, #0
ADD R1, R1, #1
LD R3, FIRST_FREE_COUNT

FIRST_FREE_COUNT_LOOP	AND R1, R1, R0
			BRp EXIT_FIRST_FREE
			ADD R1, R1, R1
			ADD R2, R2, R2
			ADD R3, R3, #-1
BRp FIRST_FREE_COUNT_LOOP
AND R2, R2, #0
ADD R2, R2, #-1

EXIT_FIRST_FREE

;HINT Restore
LD R7, R7_BACKUP_X4400
RET
;--------------------------------
;Data for subroutine FIRST_FREE
;--------------------------------
BUSYNESS_ADDR_FIRST_FREE .Fill xA000
R7_BACKUP_X4400		.BLKW #1
FIRST_FREE_COUNT	.FILL #16

.ORIG x4600
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: Get input
; Inputs: None
; Postcondition: 
; The subroutine get up to a 5 digit input from the user within the range [-32768,32767]
; Return Value (R1): The value of the contructed input
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to get input from the user, except the prompt is different.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------
ST R7, BACKUP_R7_4600

GENERAL_INPUT_LOOP
  ;Example of how to Output Intro Message
  LEA R0, NEWLINE
  PUTS
GENERAL_INPUT_LOOP_NO_NEWLINE
  LEA R0, prompt  ;Output Intro Message
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
  ST R0, FLAG
  
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
  
  ADD R6, R3, #-2 	;CHECK IF COUNTER IS LESS THAN 5
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
    ADD R6, R3, #-2 	;CHECK IF COUNTER IS LESS THAN 5
    BRz ENTER_ERROR
    LD R2, HEX_ENTER
    ADD R2, R2, R0
  BRz TWO_COMPLIMENT
  ;BR END_PROGRAM
  
  CHECK_LOOP_LESS_THAN_5
    ADD R6, R3, #-2 	;CHECK IF COUNTER IS LESS THAN 5
    BRn NEED_NEWLINE
  BR GET_NUM
  
  NEED_NEWLINE
  ;Example of how to Output Error Message
  LEA R0, NEWLINE
  PUTS
  ENTER_ERROR
  LEA R0, Error_message_2  ;Output Error Message
  PUTS
BR GENERAL_INPUT_LOOP_NO_NEWLINE

END_PROGRAM
ADD R5, R5, #0
BRn ENTER_ERROR
LD R0, UPPER_BOUND
ADD R0, R0, R5
BRp ENTER_ERROR

AND R1, R1, #0
ADD R1, R1, R5

LD R7, BACKUP_R7_4600

RET
;HINT Restore

;Data for subroutine
HEX_ZERO	.FILL	-x30
HEX_NINE	.FILL	-x39
HEX_MINUS	.FILL	-x2D
HEX_PLUS	.FILL	-x2B
HEX_ENTER	.FILL	-#10
FLAG		.FILL 	x0
NEWLINE		.STRINGZ "\n"
COUNTER		.FILL 	#3
UPPER_BOUND	.FILL -#15
BACKUP_R7_4600	.BLKW #1
;--------------------------------
;Data for subroutine Get input
;--------------------------------
prompt .STRINGZ "Enter which machine you want the status of (0 - 15), followed by ENTER: "
Error_message_2 .STRINGZ "ERROR INVALID INPUT\n"
	

.ORIG x4800
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: print number
; Inputs: 
; Postcondition: 
; The subroutine prints the number that is in 
; Return Value : 
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to print the number to the user WITHOUT leading 0's and DOES NOT output the '+' 
;	for positive numbers.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------
ST R7, BACKUP_R7_4800
AND R4, R4, #0
AND R3, R3, #0
AND R5, R5, #0
ADD R5, R2, R5

ADD R5, R5, #0
BRz SKIP_LEADING_0_FOUR



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
	LD R0, HEX_ZERO_4800
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
	LD R0, HEX_ZERO_4800
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
	LD R0, HEX_ZERO_4800
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
  LD R0, HEX_ZERO_4800
  ADD R0, R0, R4
  OUT

SKIP_LEADING_0_FOUR
LD R0, HEX_ZERO_4800
ADD R0, R0, R5
OUT
;LEA R0, NEWLINE_4800
;PUTS

LD R7, BACKUP_R7_4800
RET



;--------------------------------
;Data for subroutine print number
;--------------------------------
BACKUP_R7_4800		.BLKW #1
HEX_ZERO_4800		.FILL #48
HEX_MINUS_4800		.FILL x2D
HEX_PLUS_4800		.FILL x2B
TEN_THOUSAND		.FILL #-10000
ONE_THOUSAND		.FILL #-1000
ONE_HUNDRED		.FILL #-100
TEN			.FILL #-10
RESTORE_TEN_THOUSAND	.FILL #10000
RESTORE_ONE_THOUSAND	.FILL #1000
RESTORE_ONE_HUNDRED	.FILL #100
RESTORE_TEN		.FILL #10
COUNT	 		.FILL #0
;NEWLINE_4800		.STRINGZ "\n"




.ORIG x6000
MENUSTRING .STRINGZ "**********************\n* The Busyness Server *\n**********************\n1. Check to see whether all machines are busy\n2. Check to see whether all machines are free\n3. Report the number of busy machines\n4. Report the number of free machines\n5. Report the status of machine n\n6. Report the number of the first available machine\n7. Quit\n"

.ORIG xA000			; Remote data
BUSYNESS .FILL xABCD		; <----!!!VALUE FOR BUSYNESS VECTOR!!!

;---------------	
;END of PROGRAM
;---------------	
.END
