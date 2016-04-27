;=================================================
; Name: Xiao Zhou
; Email:  xzhou016
; 
; Lab: lab 3
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================

.ORIG x3000
LD R0, PROMPT
LD R1, DATA_PTR
LD R2, DATA_SIZE

LOOP
  GETC
  STR R0, R1, #0
  ADD R1, R1, x1
  ADD R2, R2, #-1
  
  BRp LOOP
HALT




;=========
;DATA
;=========
DATA_PTR	.FILL x4000
DATA_SIZE	.FILL #10
PROMPT		.STRINGZ "Enter 10 characters\n"


;=========
;REMOTE DATA
;=========
x4000
ARRAY_1		.BLKW #10

.END