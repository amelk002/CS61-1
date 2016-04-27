;=================================================
; Name: XIAO ZHOU
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 3
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================

.ORIG x3000
LD R1, DATA_PTR
LD R2, DATA_SIZE

LOOP
  GETC
  STR R0, R1, #0
  ADD R1, R1, x1
  ADD R2, R2, #-1
  
  BRp LOOP

;=============
;DISPLAY
;============
LD R4 , DATA_PTR
LD R2 , DATA_SIZE
LDR R1, R4, #0


DISP_LOOP
  ADD R0, R1, x0
  OUT
  LD R0, NEWLINE
  OUT

  ADD R1, R1, #1
  ADD R2, R2, #-1
BRp DISP_LOOP
  
HALT




;=========
;DATA
;=========
DATA_PTR	.FILL x4000
DATA_SIZE	.FILL #10
NEWLINE		.STRINGZ "\n"


;=========
;REMOTE DATA
;=========
x4000
ARRAY_1		.BLKW #10

.END