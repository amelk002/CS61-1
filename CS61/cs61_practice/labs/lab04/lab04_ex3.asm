;=================================================
; Name: XIAO	ZHOU
; Email:  xzhou016
; 
; Lab: lab 4
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


 ; LD R1, ARRY_PTR
  ;LD R2, HEX_ZERO
  ;LD R3, INDEX
  ;GRAB_LOOP
  ;  ADD R0, R1, R2
  ;  OUT
  ;  ADD R1, R1, #1
  ;  ADD R3, R3, #-1

  ;BRp GRAB_LOOP


HALT



ARRY_PTR 	.FILL x4000
DATA_SIZE	.FILL #10
INDEX		.FILL #10
HEX_ZERO	.FILL x30


.ORIG x4000
ARRY 	.BLKW #10

.END