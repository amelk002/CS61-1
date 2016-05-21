;=================================================
; Name: Xiao Zhou
; Username: xzhou016
; 
; Assignment name: assn 6
; Lab section: 24
; TA: Jose Rodriguez
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
Menu_Loop

;load the menu
LD R0, MENU 
JSRR R0
;get which input 
ADD R0, R1, #-1
BRz Check_all_busy
ADD R0, R1, #-2
BRz Check_all_free
ADD R0, R1, #-3
BRz Check_Num_Busy
ADD R0, R1, #-4
BRz Check_Num_FREE
ADD R0, R1, #-5
BRz Check_Machine_STAT
ADD R0, R1, #-6
BRz Check_First_Free
ADD R0, R1, #-7
BRz FinishLoop
;=================
;Menu selection #1
;=================
Check_all_busy
LD R0, ALL_Busy
JSRR R0
LEA R0, NEWLINE_x3000
PUTS
ADD R2, R2, #0 ;got the machine status
BRnp Not_Busy
LEA R0, ALLBUSY
PUTS
BR Menu_Loop
Not_Busy
LEA R0, ALLNOTBUSY
PUTS
BR Menu_Loop

;=================
;Menu Selection #2
;=================
Check_all_free
LD R0, ALL_Free
JSRR R0
LEA R0, NEWLINE_x3000
PUTS
ADD R2, R2, #0 ;got the machine status
BRp Machine_free
LEA R0, NOTFREE
PUTS
BR Menu_Loop
Machine_free
LEA R0, ALLBUSY
PUTS
BR Menu_Loop

;=================
;Menu Selection #3
;=================
Check_Num_Busy
LD R0, NUM_OF_Busy
JSRR R0
LEA R0, NEWLINE_x3000
PUTS
LEA R0, BUSYMACHINE1
PUTS
LD R0, Input_Printing
JSRR R0
LEA R0, BUSYMACHINE2
PUTS
BR Menu_Loop

;=================
;Menu Selection #4
;=================
Check_Num_FREE
LD R0, NUM_OF_Free
JSRR R0
LEA R0, NEWLINE_x3000
PUTS
LEA R0, FREEMACHINE1
PUTS
LD R0, Input_Printing
JSRR R0
LEA R0, FREEMACHINE2
PUTS
BR Menu_Loop

;=================
;Menu Selection #5
;=================
Check_Machine_STAT
LEA R0, NEWLINE_x3000
PUTS
LD R0, Input_Select
JSRR R0
LEA R0, STATUS1
PUTS
ADD R2, R1, #0
LD R0, Input_Printing
JSRR R0
LD R0, Machine_Stat
JSRR R0
ADD R2, R2,#0
BRz Machine_Busy
LEA R0,STATUS3
PUTS
BR Menu_Loop
Machine_Busy
LEA R0,STATUS2
PUTS
BR Menu_Loop

;=================
;Menu Selection #6
;=================
Check_First_Free
LD R0, First_Free
JSRR R0
LEA R0, NEWLINE_x3000
PUTS
ADD R2, R2,#0
BRn NO_FREE
LEA R0, FIRSTFREE
PUTS
LD R0, Input_Printing
JSRR R0
LEA R0, FIRSTFREE2
PUTS
BR Menu_Loop
NO_FREE
LEA R0, FIRSTFREE3
PUTS
BR Menu_Loop

FinishLoop
LEA R0, NEWLINE_x3000
PUTS
LEA R0, Goodbye
PUTS
HALT
;---------------	
;Data
;---------------
;Add address for subroutines
MENU			.FILL x3200
ALL_Busy		.FILL x3400
ALL_Free		.FILL x3600
NUM_OF_Busy		.FILL x3800
NUM_OF_Free		.FILL x4000
Machine_Stat		.FILL x4200
First_Free		.FILL x4400
Input_Select		.FILL x4600
Input_Printing		.FILL x4800


;Other data 
NEWLINE_x3000		.STRINGZ "\n"
TO_ASCII		.FILL #48
;Strings for options
Goodbye .Stringz "Goodbye!\n"
ALLNOTBUSY .Stringz "Not all machines are busy\n"
ALLBUSY .Stringz "All machines are busy\n"
FREE .STRINGZ "All machines are free\n"
NOTFREE .STRINGZ "Not all machines are free\n"
BUSYMACHINE1 .STRINGZ "There are "
BUSYMACHINE2 .STRINGZ " busy machines\n"
FREEMACHINE1 .STRINGZ "There are "
FREEMACHINE2 .STRINGZ " free machines\n"
STATUS1 .STRINGZ "Machine "
STATUS2  .STRINGZ " is busy\n"
STATUS3 .STRINGZ " is free\n"
FIRSTFREE .STRINGZ "The first available machine is number "
FIRSTFREE2 .STRINGZ "\n"
FIRSTFREE3 .STRINGZ "No machines are free\n"


;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MENU
; Inputs: None
; Postcondition: The subroutine has printed out a menu with numerical options, allowed the
;                          user to select an option, and returned the selected option.
; Return Value (R1): The option selected:  #1, #2, #3, #4, #5, #6 or #7
; no other return value is possible
;-----------------------------------------------------------------------------------------------------------------
.ORIG x3200
;-------------------------------
;INSERT CODE For Subroutine MENU
;--------------------------------
;back up 
ST R7, R7_backup_x3200
;=================
;Sanitation
;================
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0

GET_INPUT
;load menu
LD R0, Menu_string_addr
PUTS
;get input put in R1
GETC 
OUT
LD R1, SEVEN
ADD R1, R1, R0
BRp no_good
LD R1, ZERO
ADD R1, R1, R0
BRn no_good
;Restore
LD R7, R7_backup_x3200
RET

no_good
LEA R0, NEWLINE
PUTS
LEA R0, Error_message_1
PUTS
BR GET_INPUT
;--------------------------------
;Data for subroutine MENU
;--------------------------------
R7_backup_x3200 	.BLKW #1
SEVEN			.FILL #-55
ZERO			.FILL #-48
NEWLINE			.STRINGZ "\n"

Error_message_1 .STRINGZ "INVALID INPUT\n"
Menu_string_addr .FILL x6000

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_BUSY
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are busy
; Return value (R2): 1 if all machines are busy,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_BUSY
;--------------------------------
.ORIG x3400
;HINT back up 
ST R7, R7_backup_x3400
;=================
;Sanitation
;================
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0

LDI R0, BUSYNESS_ADDR_ALL_MACHINES_BUSY
ADD R1, R0, #0	;see if all machines are busy
BRz ALL_ARE_BUSY
ADD R2, R2, #1
BR DONE_ALLBUS
ALL_ARE_BUSY
AND R2, R2, #0

DONE_ALLBUS
;HINT Restore
LD R7, R7_backup_x3400
RET
;--------------------------------
;Data for subroutine ALL_MACHINES_BUSY
;--------------------------------
BUSYNESS_ADDR_ALL_MACHINES_BUSY .Fill x9000
R7_backup_x3400

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: ALL_MACHINES_FREE
; Inputs: None
; Postcondition: The subroutine has returned a value indicating whether all machines are free
; Return value (R2): 1 if all machines are free,    0 otherwise
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine ALL_MACHINES_FREE
;--------------------------------
.ORIG x3600

;HINT back up 
ST R7, R7_Backup_x3600
;=================
;Sanitation
;================
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0

LDI R0, BUSYNESS_ADDR_ALL_MACHINES_FREE
ADD R1, R0, #1	;see if all machines are busy
BRz ALL_ARE_FREE
AND R2, R2, #0
BR DONE_ALLFREE
ALL_ARE_FREE
ADD R2, R2, #1

DONE_ALLFREE
;HINT Restore
LD R7, R7_Backup_x3600
RET
;--------------------------------
;Data for subroutine ALL_MACHINES_FREE
;--------------------------------
R7_Backup_x3600		.BLKW	#1
BUSYNESS_ADDR_ALL_MACHINES_FREE .Fill x9000

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_BUSY_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of busy machines.
; Return Value (R2): The number of machines that are busy
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_BUSY_MACHINES
;--------------------------------
.ORIG x3800
;HINT back up 
ST R7, R7_Backup_x3800
;=================
;Sanitation
;================
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0


LDI R0, BUSYNESS_ADDR_NUM_BUSY_MACHINES
LD R3, counter

COUNT_BUSY
ADD R0, R0, #0
BRn ignore
ADD R2, R2, #1
ignore
ADD R0, R0, R0
ADD R3, R3, #-1
BRp COUNT_BUSY 


;HINT Restore
LD R7, R7_Backup_x3800
AND R3, R3, #0 ;cleaning
RET
;--------------------------------
;Data for subroutine NUM_BUSY_MACHINES
;--------------------------------
R7_Backup_x3800		.BLKW	#1
counter			.FILL #16
BUSYNESS_ADDR_NUM_BUSY_MACHINES .Fill x9000


;-----------------------------------------------------------------------------------------------------------------
; Subroutine: NUM_FREE_MACHINES
; Inputs: None
; Postcondition: The subroutine has returned the number of free machines
; Return Value (R2): The number of machines that are free 
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine NUM_FREE_MACHINES
;--------------------------------
.ORIG x4000
;HINT back up
 ST R7, R7_Backup_x4000
;=================
;Sanitation
;================
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0


LDI R0, BUSYNESS_ADDR_NUM_FREE_MACHINES
LD R3, counter2

COUNT_FREE
ADD R0, R0, #0
BRzp ignoreBusy
ADD R2, R2, #1
ignoreBusy
ADD R0, R0, R0
ADD R3, R3, #-1
BRp COUNT_FREE 


;HINT Restore
LD R7, R7_Backup_x4000
AND R3, R3, #0 ;cleaning
RET


;HINT Restore

;--------------------------------
;Data for subroutine NUM_FREE_MACHINES
;--------------------------------
R7_Backup_x4000		.BLKW	#1
counter2		.FILL #16
BUSYNESS_ADDR_NUM_FREE_MACHINES .Fill x9000


;-----------------------------------------------------------------------------------------------------------------
; Subroutine: MACHINE_STATUS
; Input (R1): Which machine to check
; Postcondition: The subroutine has returned a value indicating whether the machine indicated
;                          by (R1) is busy or not.
; Return Value (R2): 0 if machine (R1) is busy, 1 if it is free
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine MACHINE_STATUS
;--------------------------------
.ORIG x4200
;HINT back up 
ST R7, R7_Backup_x4200
;=================
;Sanitation
;================
AND R0, R0, #0 ;cleaning
AND R2, R2, #0 ;cleaning
AND R3, R3, #0 ;cleaning
AND R4, R4, #0 ;cleaning
AND R5, R5, #0 ;cleaning
AND R6, R6, #0 ;cleaning

LDI R0, BUSYNESS_ADDR_MACHINE_STATUS
ADD R3, R3, #1 ;mask R3


;get the mask to the correct posistion
MaskingLoop
ADD R3, R3, R3
ADD R1, R1, #-1
BRp MaskingLoop

AND R3, R3, R0
BRz Machine_is_Busy
ADD R2, R2, #1
BR Finshed_Check
Machine_is_Busy
ADD R2, R2, #0

Finshed_Check
;HINT Restore
ST  R7, R7_Backup_x4200
RET
;--------------------------------
;Data for subroutine MACHINE_STATUS
;--------------------------------
R7_Backup_x4200		.BLKW	#1
BUSYNESS_ADDR_MACHINE_STATUS.Fill x9000

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: FIRST_FREE
; Inputs: None
; Postcondition: 
; The subroutine has returned a value indicating the lowest numbered free machine
; Return Value (R2): the number of the free machine
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine FIRST_FREE
;--------------------------------
.ORIG x4400
;HINT back up 
 ST R7, R7_Backup_x4400
;=================
;Sanitation
;================
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
LDI R0, BUSYNESS_ADDR_FIRST_FREE
LD R1, mask
LD R4, counter3

COUNT_FIRST
AND R3, R1, R0	;and the bit vector with mask to see if the machine is free
BRp firstMachine ; yes, then exit the loop and call it a day
ADD R1, R1, R1 ;increment the mask
ADD R2, R2, #1	;increment machine position
ADD R4, R4, #-1 ;decrement loop counter
BRp COUNT_FIRST
AND R2, R2, #0 ;if there are no free machine set R2 to -1
ADD R2, R2, #-1

firstMachine

;HINT Restore
LD R7, R7_Backup_x4400
;clean the registers except for r2 
AND R0, R0, #0 ;cleaning
AND R1, R1, #0 ;cleaning
AND R3, R3, #0 ;cleaning
AND R4, R4, #0 ;cleaning
AND R5, R5, #0 ;cleaning
AND R6, R6, #0 ;cleaning

RET

;-------------------------------
;Data for subroutine FIRST_FREE
;--------------------------------
R7_Backup_x4400		.BLKW	#1
mask			.FILL #1
counter3		.FILL #16
BUSYNESS_ADDR_FIRST_FREE .Fill x9000

;-----------------------------------------------------------------------------------------------------------------
; Subroutine: Get input
; Inputs: None
; Postcondition: 
; The subroutine get up to a 5 digit input from the user within the range [-32768,32767]
; Return Value (R1): The value of the contructed input
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to get input from the user, except the prompt is different.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------
.ORIG x4600
;HINT back up 
 ST R7 , R7_Backup_x4600
Begin_Program
;===============
;Display
;===============
LEA R0, prompt  			;Output Intro Message
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
LEA R0, nextline
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
LEA R0, Error_message_2  			;Output error Message
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
ADD R1, R2, #0	

;CLEAR ALL REGISTER
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0

LD R7, R7_Backup_x4600
RET
;--------------------------------
;Data for subroutine Get input
;--------------------------------
R7_Backup_x4600		.BLKW	#1
prompt .STRINGZ "Enter which machine you want the status of (0 - 15), followed by ENTER: "
Error_message_2 .STRINGZ "ERROR INVALID INPUT\n"
nextline	.STRINGZ "\n"
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
	
;-----------------------------------------------------------------------------------------------------------------
; Subroutine: print number
; Inputs: 
; Postcondition: 
; The subroutine prints the number that is in 
; Return Value : 
; NOTE: This subroutine should be the same as the one that you did in assignment 5
;	to print the number to the user WITHOUT leading 0's and DOES NOT output the '+' 
;	for positive numbers.
;-----------------------------------------------------------------------------------------------------------------
;-------------------------------
;INSERT CODE For Subroutine 
;--------------------------------
.ORIG x4800
ST R7, R7_Backup_x4800
ST R6, R6_Backup_x4800
;=================
;Sanitation
;================
AND R0, R0, #0 ;cleaning
AND R3, R3, #0 ;cleaning
AND R4, R4, #0 ;cleaning
AND R5, R5, #0 ;cleaning
AND R6, R6, #0 ;cleaning

ADD R5, R5, #-1
ADD R6, R6, #-1
LD R3, TEN_THOUSAND

;10,000-----------
ADD R4, R2, #0
TenThousandLoop
ADD R2, R4, #0
ADD R5, R5, #1

ADD R4, R2, R3
BRzp TenThousandLoop

ADD R5, R5, #0
BRnz LeadingZero
LD R6, Positive

LeadingZero
ADD R6, R6, #0
BRn TenThousandNotNeed
LD R0, ASCII_Zero
ADD R0, R0, R5
OUT
TenThousandNotNeed

;1000-----------------
LD R5, Negative
LD R3, ONE_THOUSAND

ADD R4, R2, #0

OneThousandLoop
ADD R2, R4, #0
ADD R5, R5, #1
ADD R4, R2, R3
BRzp OneThousandLoop

ADD R5, R5, #0
BRnz LeadingZero2
LD R6, Positive
LeadingZero2

ADD R6, R6, #0
BRn OneThousandNotNeed
LD R0, ASCII_Zero
ADD R0, R0, R5
OUT
OneThousandNotNeed

;100------------------
LD R5, Negative
LD R3, ONE_HUNDRED

ADD R4, R2, #0
OneHundredLoop
ADD R2, R4, #0
ADD R5, R5, #1

ADD R4, R2, R3
BRzp OneHundredLoop

ADD R5, R5, #0
BRnz LeadingZero3
LD R6, Positive

LeadingZero3
ADD R6, R6, #0
BRn OneHundredNotNeed
LD R0, ASCII_Zero
ADD R0, R0, R5
OUT
OneHundredNotNeed

;10------------------
LD R5, Negative
LD R3, TEN

ADD R4, R2, #0
TenLoop
ADD R2, R4, #0
ADD R5, R5, #1

ADD R4, R2, R3
BRzp TenLoop
;check R6
ADD R5, R5, #0
BRnz LeadingZero4
LD R6, Positive
LeadingZero4
ADD R6, R6, #0
BRn TenNotNeed
LD R0, ASCII_Zero
ADD R0, R0, R5
OUT

TenNotNeed
LD R0, ASCII_Zero
ADD R0, R0, R2
OUT

;0-----------------------


LD R6, R6_Backup_x4800
LD R7, R7_Backup_x4800
RET
;--------------------------------
;Data for subroutine print number
;--------------------------------
R6_Backup_x4800		.BLKW	#1
R7_Backup_x4800		.BLKW	#1
TEN_THOUSAND		.FILL    #-10000
ONE_THOUSAND		.FILL	#-1000
ONE_HUNDRED		.FILL	#-100
TEN			.FILL	#-10
Positive		.FILL	#1
Negative		.FILL	#-1
ASCII_Zero		.FILL	#48
NEWLINE_x4800		.STRINGZ "\n"

.ORIG x6000
MENUSTRING .STRINGZ "**********************\n* The Busyness Server *\n**********************\n1. Check to see whether all machines are busy\n2. Check to see whether all machines are free\n3. Report the number of busy machines\n4. Report the number of free machines\n5. Report the status of machine n\n6. Report the number of the first available machine\n7. Quit\n"

.ORIG x9000			; Remote data
BUSYNESS .FILL xABCD		; <----!!!VALUE FOR BUSYNESS VECTOR!!!

;---------------	
;END of PROGRAM
;---------------	
.END
