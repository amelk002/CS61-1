;=================================================
; Name: xzhou016
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 2
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================
.orig x3000

LD R3, DEC_65 ;R3 = #65 
LD R4, HEX_41 ;R4 = x41

HALT


;==========
;Data
;==========
DEC_65 .FILL #65
HEX_41 .FILL x41

.end

