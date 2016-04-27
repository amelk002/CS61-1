;=================================================
; Name: XIAO ZHOU
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 5
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================

.ORIG x3000

LD R5, BINARY_READ
JSRR R5

LD R5, PRINT_SUB
JSRR R5

HALT 

;================
; orig x3000 data
;================
PRINT_SUB	.FILL x3400
BINARY_READ	.FILL x3200



;=======================================================================
; Subroutine: BINARY_READ
; Parameter : null
; Postcondition: get binary input from user, add to R2, then do conversion
; Return Value: 16-bit  R2

.ORIG x3200
;=======================================================================
;========================
; Subroutine Instructions
;========================

ST R7, BACKUP_R7_3200
AND R2, R2, #0		;init R2 
LD R5, counter		;init loop count


;USER PROMPT
LEA R0, intro
PUTS
AND R3, R3, #0
ADD R3, R3, #2


GET_INPUT
;GET INPUT FROM USER
GETC
OUT		;SPIT OUT USER INPUT
BR CHECK_FOR_b

CHECK_FOR_SECOND_b
ADD R3, R3,#-1
BRnz ERROR_OUT
BR GET_INPUT
;user enter 'b' for the first input, ignore it and get binary
CHECK_FOR_b
  LD R1, b
  ADD R1, R1, R0 
BRz CHECK_FOR_SECOND_b

;user enter ' ' for the input, ignore it and get binary
CHECK_FOR_SPACE
  LD R1, HEX_SPACE
  ADD R1, R1, R0
BRz GET_INPUT

;user enter '0' for the input, goto is GoodInput for processing
CHECK_FOR_ZERO
  LD R1, HEX_ZERO
  ADD R1, R1, R0
  BRz GoodInput
  CHECK_FOR_ONE
  LD R1, HEX_ONE
  ADD R1, R1, R0
BRz GoodInput

ERROR_OUT	
  LEA R0, NEW_LINE
  PUTS
  LEA R0, error
  PUTS
  LEA R0, NEW_LINE
  PUTS
  AND R3, R3, #0
  ADD R3, R3, #2
BR GET_INPUT

GoodInput


CONVERSION_LOOP
  ADD R2, R2, R2
  LD R1, HEX_ZERO
  ADD R0, R1, R0
  BRz isNeg
  ADD R2, R2, R0
isNeg

ADD R5, R5, #-1
BRp GET_INPUT

LEA R0, NEW_LINE
PUTS
LD R7, BACKUP_R7_3200

RET

;========================
; Subroutine Data
;========================
BACKUP_R7_3200 		.BLKW #1
counter 		.FILL #16
HEX_SPACE		.FILL #-32
HEX_ZERO		.FILL -x30
HEX_ONE			.FILL -x31
b 			.FILL #-98
ARRAY_PTR		.FILL x4000
SIZE_OF_DATA		.FILL #16
intro			.STRINGZ "Enter a 2's compliment binary\n"
NEW_LINE    		.STRINGZ    "\n"
error 			.STRINGZ "Invalid Input!"



;=======================================================================

; Subroutine: SUB_intelligent_name_goes_here_3200

; Parameter (Register you are “passing” as a parameter): [description of parameter]

; Postcondition: [a short description of what the subroutine does]

; Return Value: [which register (if any) has a return value and what it means]

.orig x3400

;=======================================================================

;========================

; Subroutine Instructions

;========================

; (1) Backup R7 and all registers that this subroutine changes except Return Values
ST R7, BACKUP_R7_3400
ST R0, BACKUP_R0_3400


;LD R5, Convert_addr
;LD R6, INDEX

PRINT_LOOP

ADD R1, R2, #0

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R3, SPACE_COUNT
LD R4, SEG_LOOP_COUNT

BINARY_DISP_LOOP
  LD R2, SEG_LOOP_COUNT
  ;================
  ;4 BINARY SEGMENT
  ;================
  SEG_LOOP
    ;============
    ;DISPLAY FUNC
    ;============
    ADD R1, R1, x0
    BRzp DISP0

      DISP1
      LD R0, HEX_ONE_3400
      OUT
      BR DISPD
      
      DISP0
      LD R0, HEX_ZERO_3400
      OUT
      BR DISPD

    DISPD		;DONE
  ADD R1, R1, R1	;LEFT SHIFT <-
  ADD R2, R2, #-1	;4 DIGIT SEG COUNTER
  BRp SEG_LOOP
  
  ;===========
  ;CHECK SPACE
  ;===========
  ADD R3, R3, #-1
  BRn	NO_SPACE
    LD R0, W_SPACE
    OUT
  NO_SPACE

ADD R4, R4, #-1
BRp BINARY_DISP_LOOP

LD R0, NEW_LINE_3400		;TERMINATE WITH NEWLINE
OUT

LD R0, BACKUP_R0_3400
LD R7, BACKUP_R7_3400

RET
;========================

; Subroutine Data

;========================

BACKUP_R0_3400   .BLKW #1 ; Make one of these for each register ... ; that the subroutine changes

BACKUP_R7_3400   .BLKW #1 ; EXCEPT for Return Value(s)

Convert_addr 	.FILL x4000	; The address of where to find the data
HEX_ZERO_3400	.FILL x30
HEX_ONE_3400	.FILL x31
SEG_LOOP_COUNT	.FILL #4
SPACE_COUNT	.FILL #3
W_SPACE		.FILL x20
NEW_LINE_3400	.FILL x0A

.END