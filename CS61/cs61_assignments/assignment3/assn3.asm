;=================================================
; Name: Xiao	Zhou
; Email: xzhou016@ucr.edu
; 
; Assignment name: Assignment 3
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
LD R6, Convert_addr		; R6 <-- Address pointer for Convert
LDR R1, R6, #0			; R1 <-- VARIABLE Convert 
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

HALT
;---------------	
;Data
;---------------
Convert_addr .FILL xA000	; The address of where to find the data
HEX_ZERO	.FILL x30
HEX_ONE		.FILL x31
SEG_LOOP_COUNT	.FILL #4
SPACE_COUNT	.FILL #3
W_SPACE		.FILL x20
NEW_LINE	.FILL x0A




.ORIG xA000			; Remote data
Convert .FILL xABCD		; <----!!!NUMBER TO BE CONVERTED TO BINARY!!!
;---------------	
;END of PROGRAM
;---------------	
.END
