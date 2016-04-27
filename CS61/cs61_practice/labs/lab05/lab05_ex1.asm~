;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 5
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.ORIG x3000

LD R1, ARRY_PTR
LD R5, DATA_SIZE

ADD R3, R3, #1
LOOP
  STR R3, R1, #0
  ADD R3, R3, R3
  ADD R1, R1, #1

  ADD R5, R5, #-1
BRzp LOOP

LD R5, PRINT_SUB
JSRR R5

HALT


;=============
;LOCAL STORAGE
;=============
PRINT_SUB	.FILL x3200
ARRY_PTR 	.FILL x4000
DATA_SIZE	.FILL #10

;=======================================================================

; Subroutine: SUB_intelligent_name_goes_here_3200

; Parameter (Register you are “passing” as a parameter): [description of parameter]

; Postcondition: [a short description of what the subroutine does]

; Return Value: [which register (if any) has a return value and what it means]

.orig x3200

;=======================================================================

;========================

; Subroutine Instructions

;========================

; (1) Backup R7 and all registers that this subroutine changes except Return Values
ST R7, BACKUP_R7_3200
ST R0, BACKUP_R0_3200


LD R5, Convert_addr
LD R6, INDEX

PRINT_LOOP

LDR R1, R5, #0

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
      LD R0, HEX_ONE
      OUT
      BR DISPD
      
      DISP0
      LD R0, HEX_ZERO
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

LD R0, NEW_LINE		;TERMINATE WITH NEWLINE
OUT

ADD R5, R5, #1
ADD R6, R6, #-1
BRzp PRINT_LOOP

LD R0, BACKUP_R0_3200
LD R7, BACKUP_R7_3200

RET
;========================

; Subroutine Data

;========================

BACKUP_R0_3200   .BLKW #1 ; Make one of these for each register ... ; that the subroutine changes

BACKUP_R7_3200   .BLKW #1 ; EXCEPT for Return Value(s)

INDEX		.FILL #10
Convert_addr 	.FILL x4000	; The address of where to find the data
HEX_ZERO	.FILL x30
HEX_ONE		.FILL x31
SEG_LOOP_COUNT	.FILL #4
SPACE_COUNT	.FILL #3
W_SPACE		.FILL x20
NEW_LINE	.FILL x0A


.END