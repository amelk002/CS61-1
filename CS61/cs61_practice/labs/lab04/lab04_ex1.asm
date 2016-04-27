;=================================================
; Name: Xiao Zhou
; Email:  xzho016	
; 
; Lab: lab 4
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.ORIG x3000
LD R1, ARRY_PTR
LD R5, DATA_SIZE

ADD R3, R3, #0
LOOP
  STR R3, R1, #0
  ADD R3, R3, #1
  ADD R1, R1, #1

  ADD R5, R5, #-1
BRzp LOOP


LD R1, ARRY_PTR
LD R3, INDEX
GRAB_LOOP
  ADD R1, R1, #1
  ADD R3, R3, #-1
BRp GRAB_LOOP

LDR R2, R1, #0

HALT



ARRY_PTR 	.FILL x4000
DATA_SIZE	.FILL #10
INDEX		.FILL #6


.ORIG x4000
ARRY 	.BLKW #10

.END