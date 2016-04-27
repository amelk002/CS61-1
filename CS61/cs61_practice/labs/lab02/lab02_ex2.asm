;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 2
; Lab section: 21
; TA: Gaurav Jhaveri
; 
;=================================================

.orig x3000

LDI R3, DEC_65_PTR          ;put address of DEC_65_PTR into reg 3
LDI R4,  HEX_41_PTR         ;put address of HEX_41_PTR into reg 4

ADD R3, R3, #1
ADD R4, R4, #1

STI R3, DEC_65_PTR 	; store *r3 into pointer
STI R4, HEX_41_PTR 	; store *r4 into pointer

HALT

;;Pointer
DEC_65_PTR .FILL x4000
HEX_41_PTR .FILL x4001


;; Remote data
.orig x4000
NEW_DEC_65	.FILL #65
NEW_HEX_41	.FILL x41

.end