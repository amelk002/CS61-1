;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 1
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================

.ORIG x3000

LD R5, POINTER_DEC_65
LD R6, POINTER_HEX_41

LDR R3, R5, x0
LDR R4, R6, x0

ADD R3, R3, x1
ADD R4, R4, x1

STR R3, R5, #0
STR R4, R6, #0

HALT

;================
;Pointers
;================
POINTER_DEC_65	.FILL x4000
POINTER_HEX_41	.FILL x4001

;================
;Data
;================
.ORIG x4000
NEW_DEC_65	.FILL #65
NEW_HEX_41	.FILL x41

.end