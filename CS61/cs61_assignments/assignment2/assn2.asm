;=================================================
; Name: Xiao Zhou
; Email: xzhou016@ucr.edu
; 
; Assignment name: Assignment 2
; Lab section: 21
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY OUTside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;----------------------------------------------
;outputs prompt
;----------------------------------------------	
LEA R0, intro			; 
PUTS				; Invokes BIOS routine to output string

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
;First input
GETC                    
OUT			
ADD R1, R0, #0		
LEA R0, NEWLINE		
PUTS

;Second input
GETC                   
OUT			
ADD R2, R0, #0
LEA R0, NEWLINE	
PUTS



;---------------
;Display routine
;---------------
ADD R0, R1, #0
OUT
LD R0, WHITE_SPACE
OUT
LD R0, NEGATIVE_SIGN 
OUT
LD R0, WHITE_SPACE
OUT
ADD R0, R2, #0
OUT
LD R0, WHITE_SPACE
OUT
LD R0, EQUAL_SIGN
OUT
LD R0, WHITE_SPACE
OUT

;Convert input from ASCII char into decimal
LD R3, HEX_MASK
AND R1, R1, R3
AND R2, R2, R3

;SETUP R2 AS TWO'S COMPLIMENT
NOT R2, R2
ADD R2, R2, #1

ADD R4,R1, R2  		;ADDITION OP

BRn ANSWER_IS_NEG
LD R5, HEX_0
ADD R0, R4, R5
OUT
LEA R0, NEWLINE
PUTS
BR END_IF

ANSWER_IS_NEG
  NOT R4, R4
  ADD R4, R4, #1
  LD R0, NEGATIVE_SIGN
  OUT
  LD R5, HEX_0
  ADD R0, R4, R5
  OUT
  LEA R0, NEWLINE
  PUTS
END_IF


HALT				; Stop execution of program
;------	
;Data
;------
; String to explain what to input 
intro .STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 
NEWLINE .STRINGZ "\n"	; String that holds the newline character

NEGATIVE_SIGN .FILL x2D
EQUAL_SIGN .FILL x3D
WHITE_SPACE .FILL x20

HEX_MASK	.FILL x0F
HEX_0        .FILL    x30
NEG_HEX_0    .FILL    #-48


;---------------	
;END of PROGRAM
;---------------	
.END

