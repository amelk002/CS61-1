;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 2
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.ORIG x3000

LD R0, HEX_61
LD R1, HEX_1A

OUTPUT_LOOP	
  OUT
  ADD R0, R0, x1
  ADD R1, R1, #-1
  BRp	OUTPUT_LOOP

HALT



;================
;DATA
;================
HEX_61	.FILL x61
HEX_1A	.FILL x1A

.END