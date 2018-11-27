.data 0x10010000

					#Space asigned for MIPS BitMap
.data 0x10110000

ImgData: .space 1048576

.data 0x10210000
buff: .space 786486     

GreyscaleR: .float 0.2989		# Specific Greyscale R value 
GreyscaleG: .float 0.5870		# Specific Greyscale G value
GreyscaleB: .float 0.1140		# Specific Greyscale B value 

filename: .asciiz "tesla.bmp"		# Name of our predefined file.
OutFile: .asciiz "test.bmp"		# Name of our output file.
.data    

						#Prompt messages:

Welcome: .asciiz "|                                                          Welcome                                                                    |\n\n\n| MIPS Image Processor |\n\n\n\n\n\n\n***********************************\nPlease Select Your Option:\n\n 1.Filp Horizontally\n 2.Flip Vertically\n 3.Brightness\n 4.Negative \n 5.Saturation\n 6.Greyscale \n 7.Reset Image\n 8.Save File \n 9.Exit\n "
InError: .asciiz "Wrong Input!\nPlease Try Again"
FIleErrorMsg: .asciiz "File error\nTerminating program..."		
red_hue: .asciiz "Please enter a ine (0 - 255) to mod red by"
green_hue: .asciiz "Please enter a ine (0 - 255) to mod green by"
blue_hue: .asciiz "Please enter a ine (0 - 255) to mod blue by"
B_string: .asciiz "Please enter a precentage in Dec format (-100 <-> 100) :"
S_string: .asciiz "Pleaser enter a percentage to increase saturation by"
NegInputError: .asciiz "Your input cannot be negative"
Numogbits: .asciiz "The Number of bits in the image file is - \n"
.text


Start:

la $a0, filename    			# Establishing the name of the file as a parameter
li $v0, 13        			# Storing syscall value for file opening
li $a1, 0        			# Setting argument to read mode
li $a2, 0        			# Empty argument
syscall

move $s1, $v0        			# Storing file pointer

move $a0, $v0        			# Establishing the file pointer as a parameter
li $v0, 14        			# Storing syscall value for file reading
la $a1, buff       			# Setting buffer as argument
li $a2, 786486        			# Setting maximum number of character as argument
syscall

bgt $v0, 0, FileClose    		# Checking if the file was successfully opened
la $a0,FIleErrorMsg    			# Loading error message as argument
li $a1, 2        			# Setting warning message as argument
li $v0,55        			# Storing syscall value for dialog message
syscall
break             			# Breaking out of the program

######################## If file was successfully opened, continue here #######################
FileClose:

move $s5, $v0 		
la $a0, Numogbits			# 54 bmp haeder + 3*numofpixels;
move $a1, $v0  		
li $v0, 56	
syscall

# Close the file
li   $v0, 16          			# Syscall 16 for closing a file
move $a0, $s1         			# File pointer
syscall                			# Close file

##############################################

subi $s5, $s5, 54     			# Subtracting the 54 bmp header bits	
div $s5, $s5, 3        			# Dividing the number of bits by 3 
    	
la $s0, buff        			# Loading the buffers address
addi $s0, $s0, 54       		## ????????????????????????????????????   ##

la $s1, ImgData         		# Loading the address to the image in $s1

li $s4, 0        			# Setting the counter $s4 to 0 

#############--- Move From Buffer ( 3 bytes RGB) to ImageData (4 bytes RGB)  ---#############################

loop:

beq $s4, $s5, end_adj    		# If the end of the image has been reached branch to label end_adj

lbu $s2, ($s0)        			# Loading the R value into $s2
sb $s2, ($s1)        			# Storing value in first byte of $s1 current word position

lbu $s2, 1($s0)         		# Loading the R value into $s2
sb $s2, 1($s1)          		# Storing value in second byte of $s1 current word position

lbu $s2, 2($s0)         		# Loading the R value into $s2
sb $s2, 2($s1)  			# Storing value in third byte of $s1 current word position
      
sb $zero, 3($s1)			# Storing zero in the fourth byte of $s1 current word position

addi $s0, $s0, 3			# Iterating through the buffer (3 bytes RGB) to the next pixel
addi $s1, $s1, 4			# Iterating through the image date (4 bytes RGB) ($s1)


addi $s4, $s4, 1			# Iterate counter to keep up to date image position.
b  loop					# Branch back to the loop

end_adj:				# Label to adjust the image  by fliping it vertically since it was loaded backwards 
j FilpV


menu:					# Menu loop
la $a0, Welcome
li $v0, 51				# Syscall 51 used to prompt the user to enter an integer. 
syscall

bne $a1,$zero,InputError		# Branching to label InputError that handles cases in which the user inputs a non integer value

move $t1, $a0				# Moving the users menu entry choice  into $t1

li $t0, 1				# Loading 1 in $t0 for the option to flip horizontally 
beq $t0,$t1, FilpH			# Branch to handle feature to flip horizontally

li $t0, 2				# Loading 2 in $t0 for the option to flip vertically
beq $t0,$t1, FilpV			# Branch to handle feature to flip horizontally

li $t0, 3				# Loading 3 in $t0 for the option to manipulate the brightness  of the image
beq $t0,$t1, Brightness			# Branch to label which handles the feature to manipulate the brightness of the image

li $t0, 4				# Loading 4 in $t0 for the option to activate the negative filter feature
beq $t0,$t1, Negative			# Branch to label which handles the negative filter feature

li $t0, 5				# Loading 5 in $t0 for the option to manipulate the saturation of the image
beq $t0,$t1, Saturation			# Branch to label which handles the feature to manipulate saturation

li $t0, 6				# Loading 6 in $t0 for the option to activate the greyscale feature 
beq $t0,$t1, Greyscale			# Branch to label which handles the greyscale feature

li $t0, 7				# Loading 7 in $t0 for the option to reset the image
beq $t0,$t1, Reset			# Branch to label which handles reseting the image

li $t0, 8				# Loading 8 in $t0 for the option to save the image in bmp format
beq $t0,$t1,SaveBMP			# Branch to label which handles saving the image in bmp format

li $t0, 9				# Loading 9 in $t0 for the option to exit from the program
beq $t0,$t1, Exit			# Branch to label which handles exiting from the program


InputError:
la $a0,InError				# Wrong input loop
li $a1, 2				# Loading 2 in $a1 to declare this message dialog as a warning. 
li $v0,55				# Calling syscall 55 to print a message dialog
syscall
j menu

######################-- Menu Options Labels  --####################

FilpH:
la $a0, ImgData
jal Flip_h
j UpdateImage

FilpV:
la $a0, ImgData
jal Flip_v
la $a0, ImgData
jal Flip_h
j UpdateImage


Brightness:
la $a0, ImgData
b B_fun
j menu


Negative:
jal N_fun
j UpdateImage

Saturation:
jal S_fun
j UpdateImage

Greyscale:
jal G_fun
j UpdateImage

Reset:
b Start

SaveBMP:
jal FileSave
j menu

#############-- END OF MENU OPTIONS Labels --######################

UpdateImage:				#loop to update the image.

la $s1, ImgData        			# Loading the address of the image
li $s3, 0x10010000    			# Loading the size of the image
move $s4, $zero        			# Counter

loop2:

bge $s4, $s5, end_loop  		#Branch to end_loop in case the size has been reached 
lw $s2, ($s1)				#loading the image into $s2 from $s1
sw $s2, ($s3)				#storing the image from $s2 into $s3

addi $s1, $s1, 4			# Iterating by 4 to point to the next word
addi $s3, $s3, 4			# Iterating by 4 to point to the next word
addi $s4, $s4, 1			# Oterating by 1 to update our counter in $s4
b loop2					# Branching back so we can begin storing the new word we are at

end_loop:				# Loop jumped to when $s4 reaches the max size of the image. Jumps to the menu. 
b menu

Exit:					# Exit option to exit the program

li $v0 ,10				# Syscall option 10, terminates program
syscall
j menu

Flip_h:					# Loop to begin flipping the image horizontally

li $t5, 0       			# j = 0

loop_Row:

bge $t5, 512, end_Row

move $t0, $a0       			# x = 0, y = 0
mulo $t6, $t5, 2048    			#
add $t0, $t0, $t6
addi $t1, $t0, 2044    			#

move $t4, $0        			# i = 0

loop_line:
bge $t4, 256, end_line
lw $t2, ($t0)        		# swap
lw $t3, ($t1)
sw $t3, ($t0)
sw $t2, ($t1)

addi $t0, $t0, 4
subi $t1, $t1, 4

addiu $t4, $t4, 1   			# i ++
j loop_line
end_line:


addi $t5, $t5, 1    			# j++
j loop_Row
end_Row:

jr $ra

Flip_v:
li $t5, 0

flip_vert:

la $s1, ImgData       			#
li $s4, 0  				# i = 0
addi $s0, $s1, 1048572    		#

loop3:

bge $s4, $s5, inverte
lw $s2,($s0)				# Swap
lw $s3,($s1)				# Swap
sw $s2,($s1)				# Swap
sw $s3,($s0)				# Swap
addi $s1, $s1, 4			# Go To Next 4 byts 
subi $s0, $s0, 4			# Go To previous 4 byts 
addi $s4, $s4, 2			# Add 2 Words to count 
j loop3

inverte:
jr $ra

N_fun:

la $t6, ImgData				# Loading the address to the image in $t6
li $t7, 255				# Loading 255 into $t7
li $s4,0				# Resetting our counter

loop_neg:

lb $t3, 0($t6)	
lb $t4, 1($t6)
lb $t5, 2($t6)
sll $t3, $t3, 24
sll $t5, $t5, 24
sll $t4, $t4, 24

subu $t3,$t7,$t3
subu $t4,$t7,$t4
subu $t5,$t7,$t5
srl $t4, $t4, 24
srl $t5, $t5, 24
srl $t3, $t3, 24
add $t3,$t3,$t0
add $t4,$t4,$t1
add $t5,$t5,$t2
sb $t3, 0($t6)
sb $t4, 1($t6)
sb $t5, 2($t6)
addi $s4,$s4,1
addi $t6, $t6, 4
blt $s4,$s5,loop_neg
	
jr $ra


B_fun:
move $t6, $a0
li $v0, 51
la $a0, B_string			# prompt user input
syscall
bne $a1, $zero, InputError
mtc1 $a0, $f0	
cvt.s.w $f1,$f0				# convert user input 
li $t0, 100
mtc1 $t0, $f10
cvt.s.w $f10, $f10
div.s $f10, $f1,$f10
li $t9, 1
mtc1 $t9, $f2				# loading 1 to base precentage
cvt.s.w $f2, $f2
add.s $f2,$f2,$f10
li $s4, 0

loop_b:
lb $t3, 0($t6)				# load bits
lb $t4, 1($t6)
lb $t5, 2($t6)

sll $t3, $t3, 24			# isolation
sll $t5, $t5, 24
sll $t4, $t4, 24
srl $t4, $t4, 24
srl $t5, $t5, 24
srl $t3, $t3, 24

mtc1 $t3, $f3				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f3,$f3				# Converting from integer to single precision.

mtc1 $t4, $f4				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f4,$f4				# Converting from integer to single precision.

mtc1 $t5, $f5				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f5,$f5				# Converting from integer to single precision.

mul.s $f3,$f3,$f2			
mul.s $f4,$f4,$f2
mul.s $f5,$f5,$f2

li $t9, 255				# Loading 266
mtc1 $t9, $f6
cvt.s.w $f6, $f6
c.lt.s $f3, $f6
bc1t  keepR
mov.s $f3 $f6

keepR:					# Capping R value to 255
c.lt.s $f4, $f6
bc1t keepG
mov.s $f4, $f6

keepG:					# Capping G value to 255
c.lt.s $f5, $f6
bc1t keepB 
mov.s $f5, $f6 

keepB:					# Capping B value to 255

cvt.w.s $f3,$f3				# Converting float to integer
cvt.w.s $f4,$f4		
cvt.w.s $f5,$f5
mfc1 $t3,$f3				# Moving from co processor to main registers
mfc1 $t4,$f4
mfc1 $t5,$f5
sb $t3, 0($t6)				# Storing byte back into $t6 with the adjusted 
sb $t4, 1($t6)				# RGB values
sb $t5, 2($t6)
addi $s4,$s4, 1
addi $t6, $t6, 4
blt $s4,$s5,loop_b
j UpdateImage

S_fun:					#function to run Saturation changes

li $v0, 51				#Syscall 51 to print filter percentage prompt
la $a0, S_string			#loading address to percentage prompt 
syscall

bne $a1, $zero, InputError 		# Ouputing error message if percentage is not okay.
blt $a0, $zero, InputError 		# Outputing error message if percentage is negative
mtc1 $a0, $f0				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f0, $f0			# Converting from integer to single precision.

li $t0, 100				# Loading 100 in $t0
mtc1 $t0, $f10				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f10, $f10			# Converting from integer to single precision.

div.s $f0, $f0, $f10			# Dividing the percentage by 100 to reduce the range down to 0-1

li $t1, 1				# loading 1 into $t1
mtc1 $t1, $f11				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f11, $f11		# Converting from integer to single precision.

addi $t2, $zero, 0			# Loading 0 into $t2
mtc1 $t2, $f12				# Moving from origianl registers to floating point registers (Coprocessor) 
cvt.s.w $f12, $f12			# Converting from integer to single precision.


la $t6, ImgData				#loading img address
li $s4, 0				#counter



LoopSat: 

lb $t3, 0($t6)				# Loading R value from first byte of $t6
lb $t4, 1($t6)				# Loading G value from second byte of $t6
lb $t5, 2($t6)				# Loading the B value from third byte of $t6 

sll $t3, $t3, 24			# RGB isolation
sll $t5, $t5, 24
sll $t4, $t4, 24
srl $t4, $t4, 24
srl $t5, $t5, 24
srl $t3, $t3, 24
					# End of RGB isolation
				
bgt $t3, $t4, RB_MAX			# Branches to filter out the minimum and maximum values
bgt $t4, $t5, G_MAX			# Similar to a min() or max() function in C. 
j B_MAX


B_MAX: 					# Loop label reached if B is declared as max
move $s2, $t3				# If B is MAX then we already know MIN is R
move $s3, $t5				# Storing B in MAX
j END

RB_MAX:
bgt $t3, $t5, R_MAX
move $s3, $t5				# Storing B in MAX ($s3)
move $s2, $t4				# Storing G in MIN ($s2)
j END



R_MAX:					# R is declared as MAX as defined in earlier branches

move $s3, $t3				# Storing R in MAX ($s3)
bgt $t4, $t5, B_MIN			# Check if green or blue is smaller and assign to minimum
move $s2, $t4				# Assigning G to minimum ($s2) if branch not passed 
j END

B_MIN: 
move $s2, $t5				# Assigning Blue to minimum ($s2)
j END

G_MAX:
move $s3, $t4				# Assigning G to MAX ($s3) 
bgt $t3, $t5, B_MIN			# Using a branch to check if R or B is minimum	
move $s2, $t3				# Assigning R to MIN if the branch does not pass
j END


END:					# Last loop within the Saturation feature

		################# Converting MAX and MIN into floating point numbers ######################
				
mtc1 $s2, $f2				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f2, $f2			# MIN

mtc1 $s3, $f3				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f3, $f3			# MAX

		################# Converting the RGB values into floating point numbers	###################
		
mtc1 $t3, $f14				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f14, $f14			# R

mtc1 $t4, $f15				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f15, $f15			# G	

mtc1 $t5, $f16				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f16, $f16			# B


mul.s $f2, $f2, $f0			# Multiplying the minimum value by the ratio our user wants to change the saturation
					# Saved in $f0

					# DELTA!!!
sub.s $f9, $f3, $f2			# subtracting minimum ($f2) from max ($f3) to get delta in f9

sub.s $f14, $f14, $f2			# Subtracting the minimum from the R Value
sub.s $f15, $f15, $f2			# Subtracting the minimum from the G value
sub.s $f16, $f16, $f2			# Subtracting the minimum from the B Value




c.le.s $f2, $f12			# If $f2 (MIN) is bigger than  $f12 then we are branching away from the divide
bc1t NODIV
div.s $f3, $f3, $f9    			# Assigning (MAX = MAX / DELTA)
j ABOVEZERO

NODIV:
mov.s $f3, $f11 			# Assign 1 to $f3 

ABOVEZERO:

mul.s	$f14, $f14, $f3			# Multiplying the R value by the maximum 
mul.s	$f15, $f15, $f3			# Muliplying the G value by the maximum	
mul.s   $f16, $f16, $f3			# Multiplying the B value by the maximum



cvt.w.s $f14, $f14			# Converting these floating point numbers back to integers. 
mfc1 $t0, $f14				# Moving from coproccessor one (Floating point registers) to the CPU registers

cvt.w.s $f15, $f15			# Converting these floating point numbers back to integers. 
mfc1 $t1, $f15				# Moving from coproccessor one (Floating point registers) to the CPU registers

cvt.w.s $f16, $f16			# Converting these floating point numbers back to integers. 
mfc1 $t2, $f16				# Moving from coproccessor one (Floating point registers) to the CPU registers

sb $t0, 0($t6) 				# Storing R byte into $t6 and in the first byte position. 
sb $t1, 1($t6)				# Storing G byte into $t6 and in the second byte position
sb $t2, 2($t6)				#storing B byte into $t6 and in the third byte position

addi $s4, $s4, 1			# Iterating our counter
addi $t6, $t6, 4			# Iterating the image position pointer to move to the next 
blt $s4, $s5, LoopSat			# 	part of the image we need to manipulate
j UpdateImage

G_fun:
la $t6, ImgData				# Loading img address
li $s4, 0		 		# Counter


G_loop:
					# Loading our RGB value bits
lbu $t3, 0($t6)				# R
lbu $t4, 1($t6)				# G
lbu $t5, 2($t6)				# B



mtc1 $t3, $f13				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f13, $f13			# Converting from single percision floating point number to integer 
					# R

mtc1 $t4, $f14				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f14, $f14			# Converting from single percision floating point number to integer 
					# G

mtc1 $t5, $f15				# Moving the values to the floating point registers (coprocessor)
cvt.s.w $f15, $f15			# Converting from single percision floating point number to integer 
					# B
	
l.s $f16, GreyscaleR			# Multiplying R value by greyscale R value
mul.s $f13, $f13, $f16		

l.s $f16, GreyscaleG			# Multiplying G value by greyscale G value
mul.s $f14, $f14, $f16

l.s $f16, GreyscaleB			# Multiplying G value by greyscale B value
mul.s $f15, $f15, $f16 

add.s $f16, $f13, $f14			# Adding the new RGB values together
add.s $f16, $f16, $f15
	
cvt.w.s $f16, $f16			# Converting from single percision floating point number to integer 
mfc1 $t7, $f16				# Moving the value from the floating point registers (Coprocessor) to the our registers

sb $t7, 0($t6)				# Storing back the modified value as R at position 0 in $t6 current word position 
sb $t7, 1($t6)				# Storing back the modified value as G at position 1 in $t6 current word position
sb $t7, 2($t6)				# Storing back the modified value as B at position 2 in $t6 current word position

addi $s4, $s4, 1			# Iterating our counter 
addi $t6,$t6, 4				# Iterating through our image
blt $s4, $s5, G_loop			# Branching back to the beginning of the loop if the image still has not fully been modified


jr $ra					# Jumping back to our position when the feature is fully implemented

FileSave:				# Loop that saves the modified file 

la $a0, ImgData
jal Flip_v
la $a0, ImgData
jal Flip_h
la $s0, buff        
addi $s0, $s0, 54    

la $s1, ImgData        

li $s4, 0        

loop5:
beq $s4, $s5, end_adj5    
lb $t0, ($s1)
lb $t1, 1($s1)
lb $t2, 2($s1)
sb $t0, ($s0)              
sb $t1, 1($s0)        
sb $t2, 2($s0)        		#
addi $s0, $s0, 3
addi $s1, $s1, 4

addi $s4, $s4, 1
b  loop5
end_adj5:


la $a0, OutFile    		#open file
li $v0, 13
li $a1, 1
li $a2, 0
syscall
move $s7, $v0        		# Store File Pointer
move $a0, $v0
li $v0, 15        		# Write File To Buffer
la $a1, buff    
li $a2, 786486
syscall
bgt $v0, 0, CloseOut   		#if file not read brake
la $a0,FIleErrorMsg
li $a1, 2
li $v0,55
syscall
break

			# Closing the file - Either input or output #
CloseOut:
move $t8, $v0         		# Storing the current value of v0 into a register DO WE NEED THIS?
li   $v0, 16          		# Storing syscall value for file closing
move $a0, $s7          		# Setting the file pointer as an argument for the syscall
syscall                
la $a0, ImgData
jal Flip_v
jal Flip_h
j UpdateImage
