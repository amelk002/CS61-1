;=================================================
; Name: Xiao Zhou
; Email:  xzhou016@ucr.edu
; 
; Lab: lab 1
; Lab section: 22
; TA: Bryan Marsh
; 
;=================================================

.orig x3000
;------------
;Instructions
;------------

	LEA R0, MSG_TO_PRINT 	;R0 <-- the location of the label: MSG_TO_PRINT
	PUTS 			;Prints string defined at MSG_TO_PRINT

	HALT			;terminate program


;------------
;Local data
;------------
	MSG_TO_PRINT	.STRINGZ "Hello world!!!\n"
.end
