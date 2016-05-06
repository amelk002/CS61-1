;=================================================
; Name: 
; Email: 
; 
; Assignment name: Assignment 5
; Lab section: 
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------


HALT
;---------------	
;Data
;---------------
TIMES .STRINGZ " * "
EQUALS .STRINGZ " = "
OVERFLOW .STRINGZ "Overflow!"




;------------
;Remote data
;------------

;-------------------
; Subroutine to get input from user and store value in R1
;-------------------
.ORIG x3200
;HINT back up 


;Example of how to Output Intro Message
;LD R0, introMessage ;Outputs Intro Message
;PUTS

;Eaxmple of how to Output Error Message
;LD R0, errorMessage  ;Outputs Error Message
;PUTS


;HINT Restore

;Data for subroutine
introMessage .FILL x6000
errorMessage .FILL x6100


;-------------------
; Subroutine to multiply two numbers help in Register x and Register y and store result
; into Register z
;-------------------
.ORIG x3400
;HINT back up 

;HINT Restore

;Data for subroutine


;-------------------
; Subroutine to ouput number in Register x
;-------------------
.ORIG x3800
;HINT back up 

;HINT Restore

;Data for subroutine



.ORIG x6000
;---------------
;messages
;---------------
intro .STRINGZ	"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"
;---------------
;error_messages
;---------------
.ORIG x6100	
error_mes .STRINGZ	"ERROR INVALID INPUT\n"

;---------------
;END of PROGRAM
;---------------
.END
;-------------------
;PURPOSE of PROGRAM
;-------------------
