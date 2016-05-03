;=================================================
; Name: Xiao Zhou
; Username: xzhou016
; 
; Lab: lab 6
; Lab section: 24
; TA: Jose Rodriguez
; 
;=================================================
.ORIG x3000
;get input subroutine
JSR GetNum

;display value subroutine
LD R5, DeciAdd
JSRR R5

HALT 

;===============
;.ORIG x3000 data
;===============
DeciAdd		.FILL x4000


;=======================================================================
; Subroutine: GetNum
; Parameter : null
; Postcondition: get input and transform into decimal 
; Return Value: 16-bit  R2

.orig x3200
;=======================================================================
GetNum
ST R7, BACKUP_R7_3200
;-------------
;Instructions
;-------------

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
Begin_Program
;===============
;Display
;===============
LEA R0, intoMessage  			;Output Intro Message
PUTS

;set input as positive by default
ADD R5, R5, #1
ADD R4, R4, #1
ST R5, sign

;Input
GetInput

GETC
OUT

;======================
;Check what the input is
;======================
ErrorCheck
;check return_character
LD R1, return_character
ADD R1, R0, R1
BRz ErrorReturn

CheckMinus
LD	R1, Minus
ADD 	R1, R0, R1
BRnp	CheckPlus
ADD R6, R6, #1
ST R6, flag
AND R5, R5, #0
ST R5, sign
BR setSign

CheckPlus
LD	R1, Plus
ADD	R1, R0, R1
BRnp	notSign
ADD R5, R5, #1
ST R5, sign
ADD R6, R6, #1
ST R6, flag

setSign
ADD R4, R4, #0
BRz isNotNum
ADD R4, R4, #-1
BR GetInput

notSign
;Check for number
CheckZero
LD	R1, Zero
ADD 	R1, R0, R1
BRn	isNotNum
CheckNine
LD 	R1, Nine
ADD 	R1, R0, R1
BRp	isNotNum
ADD R6, R6, #1 ;the input is valid
ST R6, flag


;store the first number
; LD R5, sign
; ADD R5, 
LD R1, ASCII
ADD R0, R0, R1
ADD R2, R2, R0
ST R2, number
;ADD R4, R4, #-1

; LD R6, flag ;see if input is valid, if yes do a loop
ADD R6, R6, #0
BRp R2AddLoop
BR GetInput

R2AddLoop
LD R3, number

AND R2, R2, #0
BeginLoop
ADD R2, R2, #10
ADD R3, R3, #-1
BRp BeginLoop

;ST R2, number
BR GetInput


isNotNum
AND R6, R6, #0
LEA R0, NEWLINE
PUTS
;========
;clear all register used
AND R1, R1, #0
AND R2, R2, #0
AND R4, R4, #0
AND R5, R5, #0

ErrorReturn
ADD R6, R6, #0
BRp Display
LEA R0, errorMessage  			;Output error Message
PUTS
AND R6, R6, #0
BR Begin_Program

Display
LD R2, number
LD R5 ,sign
ADD R5, R5, #0
BRp Done
TwoComp
NOT R2, R2
ADD R2, R2, #1

Done

LD R7, BACKUP_R7_3200
AND R4, R4 ,#0
AND R6, R6, #0
AND R0, R0, #0
RET

;---------------	
;Data
;---------------
BACKUP_R7_3200	.BLKW #1
ASCII 		.FILL #-48		;Convert ASCII to Hex for processing
Minus		.FILL #-45
Plus		.FILL #-43
return_character .FILL #-10
Zero		.FILL #-48
Nine		.FILL #-57
count		.FILL #9
clear		.FILL #0
flag		.FILL #0
sign		.FILL #0
number		.FILL #0



intoMessage 	.STRINGZ	"Input a positive decimal number (max 5 digits), followed by ENTER\n"
errorMessage 	.STRINGZ	"ERROR INVALID INPUT\n"
NEWLINE		.STRINGZ "\n"



;=======================================================================
; Subroutine: DeciAdd
; Parameter : R2
; Postcondition: add input up and combine into a single decimal value +1 
; Return Value: 16-bit  R2

.orig x4000
;=======================================================================
;========================
; Subroutine Instructions
;========================


ST R7, BACKUP_R7_4000
;put the value got into R2, add 1 to it
ADD R2, R2, #1
AND R4, R4, #0 ;clear reg just to make sure it's clean
LD R5, TOASCII; get ascii for display

;=====================
;first subtract r2 by 10,000
Minus_ten_thousand
LD R1, ten_thousand

canDO
ADD R3, R2, #0 ; keep a backup to restore later
ADD R2, R2, R1
BRn Minus_one_thousand
ADD R4, R4, #1
BR canDO

;==================
;subtract r2 by 1000
Minus_one_thousand
ADD R0, R4, R5 ;display the last counter
BRz LeadingZeroSkip
OUT

LeadingZeroSkip
AND R4, R4, #0 ;clear reg just to make sure it's clean
ADD R2, R3 , #0
LD R1, one_thousand
canDO1
ADD R3, R2, #0 ; keep a backup to restore later
ADD R2, R2, R1
BRn Minus_one_hundred
ADD R4, R4, #1
BR canDO1

;==================
;subtract r2 by 100
Minus_one_hundred
ADD R0, R4, R5 ;display the last counter
BRz LeadingZeroSkip1
OUT

LeadingZeroSkip1
AND R4, R4, #0 ;clear reg just to make sure it's clean
ADD R2, R3 , #0
LD R1, one_hundred
canDO2
ADD R3, R2, #0 ; keep a backup to restore later
ADD R2, R2, R1
BRn Minus_ten
ADD R4, R4, #1
BR canDO2

;==================
;subtract r2 by 1000
Minus_ten
ADD R0, R4, R5 ;display the last counter
BRz LeadingZeroSkip2
OUT

LeadingZeroSkip2
AND R4, R4, #0 ;clear reg just to make sure it's clean
ADD R2, R3 , #0
LD R1, ten
canDO3
ADD R3, R2, #0 ; keep a backup to restore later
ADD R2, R2, R1
BRn done
ADD R4, R4, #1
BR canDO3

done

ADD R0, R4, R5
OUT
ADD R0, R3, R5
OUT


LD R7, BACKUP_R7_4000
RET

;---------------	
;Data
;---------------
BACKUP_R7_4000		.BLKW #1
TOASCII			.FILL #48
ten_thousand		.FILL #-10000
one_thousand		.FILL #-1000
one_hundred		.FILL #-100
ten			.FILL #-10
counter 		.FILL #0

