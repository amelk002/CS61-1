;=================================================
; Name: Xiao Zhou
; Username: xzhou016@ucr.edu
; 
; Lab: lab 3
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.ORIG x3000

LD R1, DATA_PTR

LOOP
  GETC
  OUT
  STR R0, R1, #0		;store character in r4 in R6

  ADD R1, R1, #1		;increment pointer location by 1
  ADD R2, R2, #1
  ADD R0, R0, #-10
BRp LOOP

;========
;DISPLAY
;========
LEA R0, NEWLINE
PUTS

LD R1, DATA_PTR


DISPLAY_LOOP
LDR R0, R1, #0
OUT
LD R0, space
OUT

ADD R1, R1, #1		;increment pointer location by 1
ADD R2, R2, #-1		;decrement data size by 1
BRp DISPLAY_LOOP

HALT

;======
;Data
;======
DATA_PTR .FILL x4000
NEWLINE .STRINGZ "\n"	; String that holds the newline character
space .FILL x20
;===========
;Data REMOTE
;===========
.ORIG x4000
DATA	.FILL x40
.END