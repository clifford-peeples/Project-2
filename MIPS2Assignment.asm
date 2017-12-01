#MIPS 2 Programming Assignment Clifford Peeples



.data #Submits data to program

userInput: .space 9 #8 digit hexidecimal 
prompt: .asciiz "Enter string: " 
tooLarge: .asciiz "too large"
invalid: .asciiz "NaN"
useroutput: .asciiz " "
stringlenmess: .asciiz "\n The length of this string is: "


.text

main: 

#storing user input
    li $v0, 8 #get user input for a string
	la $a0, userinput #loads the address of space and stores it into $a0
	la $a1, 9 #gets the length of $a1 to prevent overflow
	syscall 

#Converting Userin into Decimal
  
  #Function call to pull in the length of the string
 jal getLength
 move $t5,$a0 #length: $t5
 move $s0,$t5 #string length
 li $t0,0 #initialize i for loop
 li $t3,0 #initialize number for output
 li $t2,0
 la $a0,userinput #loading the users input
 jal subprogram2 #Function call to actually convert the integer
printval:#printing overall value
	 move $a0,$s3
	 li $v0,1
	 syscall
exit: 
	li $v0, 10 #loads op code exit program
	syscall #exits program
	

#FUNCTIONS USED IN THE MAIN FUNCTION

##Finding Length of String##
#li $t2,0 #initialize count to zero
getLength:
 lb $t0,0($a0)
 beq $t0,0,exitgetLength
 beq $t0,10,exitgetLength
 addi $a0, $a0, 1
 addi $t2,$t2, 1
 j getLength
 exitgetLength:
 move $a0, $t2 
 jr $ra
 #prints user input length
    la $a0, stringlenmess #print length premessage
	li $v0, 4 #opcode to print a string
	syscall
	
	li $v0, 1 #opcode to print the length of the string
	syscall 
	
	#$a0 now has the length of the string
 
