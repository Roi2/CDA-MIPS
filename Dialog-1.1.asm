.data 0x10010000

#Space asigned for MIPS BitMap
.data 0x10110000

ImgData: .space 1048576

.data 0x10210000
buff: .space 786486     

filename: .asciiz "tesla.bmp"
OutFile: .asciiz "test20.bmp"
.data    
Welcome: .asciiz "|                                                          Welcome                                                                    |\n\n\n| MIPS Image Processor |\n\n\n\nÂ´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶â€¦â€¦..\nÂ´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦â€¦\nÂ´Â´Â´Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦â€¦â€¦.\nÂ´Â´Â´Â´Â´Â¶Â´Â´Â´Â´Â´Â¶Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â¶Â¶â€¦â€¦â€¦â€¦..\nÂ´Â´Â´Â´Â´Â¶Â´Â´Â´Â´Â´Â¶Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦..\nÂ´Â´Â´Â´Â´Â¶Â´Â´Â´Â´Â¶Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦..\nÂ´Â´Â´Â´Â´Â´Â¶Â´Â´Â´Â¶Â´Â´Â´Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â´Â´Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â¶Â¶Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦\nÂ´Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â´Â´Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦..\nÂ´Â´Â¶Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦.\nÂ´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â´Â´Â´Â´Â´Â¶Â¶Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶â€¦..\nÂ´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â´Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶Â¶â€¦â€¦\n\n***********************************\nPlease Select Your Option:\n\n 1.Filp Horizontally\n 2.Flip Vertically\n 3.Brightness\n 4.Hue\n 5.Vibrance\n 6.Saturation\n 7.Reset Image\n 8.Save File \n 9.Exit\n "
InError: .asciiz "Wrong Input!\nPlease Try Again"
FIleErrorMsg: .asciiz "File error\nTerminating program..."
red_hue: .asciiz "Please enter a ine (0 - 255) to mod red by"
green_hue: .asciiz "Please enter a ine (0 - 255) to mod green by"
blue_hue: .asciiz "Please enter a ine (0 - 255) to mod blue by"
B_string: .asciiz "Please enter a precentage in Dec format (-100 <-> 100) :"
S_string: .asciiz "Pleaser enter a percentage to increase saturation by"
HR_string: .asciiz "Please enter a Red Value to change to (0-255)"
HG_string: .asciiz "Please enter a Green value to change to (0-255)"
HB_string: .asciiz "Please enter a Blue value to change to (0-255)"
NegInputError: .asciiz "Your input cannot be negative"
Numogbits: .asciiz "The Number of bits in the image file is - \n"
.text

Start:
la $a0, filename    # Establishing the name of the file as a parameter
li $v0, 13        # Storing syscall value for file opening
li $a1, 0        # Setting argument to read mode
li $a2, 0        # Empty argument
syscall

move $s1, $v0        # Storing file pointer

move $a0, $v0        # Establishing the file pointer as a parameter
li $v0, 14        # Storing syscall value for file reading
la $a1, buff        # Setting buffer as argument
li $a2, 786486        # Setting maximum number of character as argument
syscall

bgt $v0, 0, FileClose    # Checking if the file was successfully opened
la $a0,FIleErrorMsg    # Loading error message as argument
li $a1, 2        # Setting warning message as argument
li $v0,55        # Storing syscall value for dialog message
syscall
break             # Breaking out of the program

# If file was successfully opened, continue here #
FileClose:
move $s5, $v0
la $a0, Numogbits	# 54 bmp haeder + 3*numofpixels;
move $a1, $v0
li $v0, 56
syscall

# Close the file
li   $v0, 16           
move $a0, $s1          #
syscall                # close file

##############################################

subi $s5, $s5, 54     
div $s5, $s5, 3        
    
la $s0, buff        
addi $s0, $s0, 54    

la $s1, ImgData        

li $s4, 0        
#############--- Move From Buffer ( 3 byts RGB) to ImaheData (4 byts RGB)  ---#############################
loop:
beq $s4, $s5, end_adj    

lbu $s2, ($s0)        
sb $s2, ($s1)        
lbu $s2, 1($s0)        
sb $s2, 1($s1)        #
lbu $s2, 2($s0)        #
sb $s2, 2($s1)        #
sb $zero, 3($s1)
addi $s0, $s0, 3
addi $s1, $s1, 4

addi $s4, $s4, 1
b  loop
end_adj:

j FilpV

menu:
la $a0, Welcome
li $v0, 51
syscall
bne $a1,$zero,InputError
move $t1, $a0
li $t0, 1
beq $t0,$t1, FilpH
li $t0, 2
beq $t0,$t1, FilpV
li $t0, 3
beq $t0,$t1, Brightness
li $t0, 4
beq $t0,$t1, Hue
li $t0, 5
beq $t0,$t1, Vibrance
li $t0, 6
beq $t0,$t1, Saturation
li $t0, 7
beq $t0,$t1, Reset
li $t0, 8
beq $t0,$t1,SaveBMP
li $t0, 9
beq $t0,$t1, Exit

InputError:
la $a0,InError
li $a1, 2
li $v0,55
syscall
j menu
######################-- Menu Options  ----####################
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

Hue:
la $a0, ImgData
b hue_fun
j menu

Vibrance:
la $t6, ImgData
li $t7, 255
li $s4,0
loop_neg:
	lb $t3, 0($t6)
	lb $t4, 1($t6)
	lb $t5, 2($t6)
	sll $t3, $t3, 24
	sll $t5, $t5, 24
	sll $t4, $t4, 24
	subu $t3,$t7,,$t3
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
j menu

Saturation:
jal S_fun
j UpdateImage


Sobel:
j menu

Reset:
b Start

SaveBMP:
jal FileSave
j menu

UpdateImage:
la $s1, ImgData        #
li $s3, 0x10010000    #
move $s4, $zero        # i = 0

loop2:
bge $s4, $s5, end_loop
lw $s2, ($s1)
sw $s2, ($s3)
addi $s1, $s1, 4
addi $s3, $s3, 4
addi $s4, $s4, 1
b loop2
end_loop:
b menu

Exit:
li $v0 ,10
syscall
j menu
Flip_h:
li $t5, 0        # j = 0

loop_Row:
bge $t5, 512, end_Row

move $t0, $a0        # x = 0, y = 0
mulo $t6, $t5, 2048    #
add $t0, $t0, $t6
addi $t1, $t0, 2044    #

move $t4, $0        # i = 0
loop_line:
bge $t4, 256, end_line
lw $t2, ($t0)        # swap
lw $t3, ($t1)
sw $t3, ($t0)
sw $t2, ($t1)

addi $t0, $t0, 4
subi $t1, $t1, 4

addiu $t4, $t4, 1    # i ++
j loop_line
end_line:


addi $t5, $t5, 1    # j++
j loop_Row
end_Row:

jr $ra
Flip_v:
li $t5, 0
flip_vert:
la $s1, ImgData        #
li $s4, 0   # i = 0
addi $s0, $s1, 1048572    #
loop3:
bge $s4, $s5, inverte
lw $s2,($s0)		# Swap
lw $s3,($s1)		# Swap
sw $s2,($s1)		# Swap
sw $s3,($s0)		# Swap
addi $s1, $s1, 4	# Go To Next 4 byts 
subi $s0, $s0, 4	# Go To previous 4 byts 
addi $s4, $s4, 2	#Add 2 Words to count 
j loop3
inverte:
jr $ra

hue_fun:
move $t6, $a0
la $a0, red_hue
li $v0, 51
syscall
move $t0, $a0
la $a0, green_hue
syscall
move $t1, $a0
la $a0, blue_hue
syscall	
move $t2, $a0
li $s4,0
loop_hue:
	lb $t3, 0($t6)
	lb $t4, 1($t6)
	lb $t5, 2($t6)
	sll $t3, $t3, 24
	sll $t5, $t5, 24
	sll $t4, $t4, 24
	add $t3,$t3,$t0
	add $t4,$t4,$t1
	add $t5,$t5,$t2
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
	blt $s4,$s5,loop_hue
	j UpdateImage
jr $ra

B_fun:
move $t6, $a0
li $v0, 51
la $a0, B_string		#prompt user input
syscall
bne $a1, $zero, InputError
mtc1 $a0, $f0	
cvt.s.w $f1,$f0		#convert user input 
li $t0, 100
mtc1 $t0, $f10
cvt.s.w $f10, $f10
div.s $f10, $f1,$f10
li $t9, 1
mtc1 $t9, $f2		#loadin 1 to base precentage
cvt.s.w $f2, $f2
add.s $f2,$f2,$f10
li $s4, 0
loop_b:
lb $t3, 0($t6)	#load bits
lb $t4, 1($t6)
lb $t5, 2($t6)

sll $t3, $t3, 24	#isolation
sll $t5, $t5, 24
sll $t4, $t4, 24
srl $t4, $t4, 24
srl $t5, $t5, 24
srl $t3, $t3, 24

mtc1 $t3, $f3		
cvt.s.w $f3,$f3		#convert user input
mtc1 $t4, $f4
cvt.s.w $f4,$f4
mtc1 $t5, $f5
cvt.s.w $f5,$f5
mul.s $f3,$f3,$f2
mul.s $f4,$f4,$f2
mul.s $f5,$f5,$f2
li $t9, 255			#loading 266
mtc1 $t9, $f6
cvt.s.w $f6, $f6
c.lt.s $f3, $f6
bc1t  keepR
mov.s $f3 $f6
keepR:
c.lt.s $f4, $f6
bc1t keepG
mov.s $f4, $f6
keepG:
c.lt.s $f5, $f6
bc1t keepB 
mov.s $f5, $f6 
keepB:

cvt.w.s $f3,$f3
cvt.w.s $f4,$f4
cvt.w.s $f5,$f5
mfc1 $t3,$f3
mfc1 $t4,$f4
mfc1 $t5,$f5
	sb $t3, 0($t6)
	sb $t4, 1($t6)
	sb $t5, 2($t6)
	addi $s4,$s4,1
	addi $t6, $t6, 4
	blt $s4,$s5,loop_b
	j UpdateImage

S_fun:

li $v0, 51	#Syscall 51 to print filter percentage prompt
la $a0, S_string		#loading address to percentage prompt 
syscall

bne $a1, $zero, InputError # Ouputing error message if percentage is not okay.
blt $a0, $zero, InputError # Outputing error message if percentage is negative
mtc1 $a0, $f0
cvt.s.w $f0, $f0

li $t0, 100
mtc1 $t0, $f10
cvt.s.w $f10, $f10

div.s $f0, $f0, $f10

li $t1, 1
mtc1 $t1, $f11
cvt.s.w $f11, $f11

addi $t2, $zero, 0
mtc1 $t2, $f12
cvt.s.w $f12, $f12


la $t6, ImgData	#loading img adrss
li $s4, 0	#counter


## $S2 IS USED TO LOAD THE IMAGE IN A DIFFERENT LOOP !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
##
##
##   IN CASE SOMETHING IS WEIRD
##
##
LoopSat: 

lb $t3, 0($t6)	#load bits
lb $t4, 1($t6)
lb $t5, 2($t6)

sll $t3, $t3, 24	#isolation
sll $t5, $t5, 24
sll $t4, $t4, 24
srl $t4, $t4, 24
srl $t5, $t5, 24
srl $t3, $t3, 24

bgt $t3, $t4, RB_MAX
bgt $t4, $t5, G_MAX
j B_MAX

B_MAX: 
move $s2, $t3
move $s3, $t5
j END

RB_MAX:
bgt $t3, $t5, R_MAX
move $s3, $t5		#Blue is the MAX
move $s2, $t4		# Green is the MIN
j END



R_MAX:	#Check if green or blue is smaller and assign to minimum
move $s3, $t3
bgt $t4, $t5, B_MIN
move $s2, $t4
j END

B_MIN: 
move $s2, $t5		# Blue is the MIN	
j END

G_MAX:
move $s3, $t4		#Green is the MAX
bgt $t3, $t5, B_MIN			
move $s2, $t3		#Red is the MIN
j END

END:

#converting MAX and MIN into floating point numbers 
mtc1 $s2, $f2
cvt.s.w $f2, $f2

mtc1 $s3, $f3
cvt.s.w $f3, $f3

#converting the RGB values into floating point numbers
mtc1 $t3, $f14
cvt.s.w $f14, $f14

mtc1 $t4, $f15
cvt.s.w $f15, $f15

mtc1 $t5, $f16			
cvt.s.w $f16, $f16

mul.s $f2, $f2, $f0		# multiplying the minimum value by the ratio our user wants to change the saturation
				#	saved in $f0

#DELTA!!!!!!
sub.s $f9, $f3, $f2		# subtracting minimum ($f2) from max ($f3) to get delta in f9

sub.s $f14, $f14, $f2		#subtracting the minimum from the R Value
sub.s $f15, $f15, $f2		#subtracting the minimum from the G value
sub.s $f16, $f16, $f2		#subtracting the minimum from the B Value


# NOT SURE WHY WE ARE CHECKING IF THE MINIMUM IS BIGGER THAN 0 (($f12)  #
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#


c.le.s $f2, $f12	#if $f2 (MIN) is bigger than  $f12 then we are branching away from the divide
bc1t NODIV
div.s $f3, $f3, $f9    	#Assigning (MAX = MAX / DELTA)
j ABOVEZERO

NODIV:
mov.s $f3, $f11

ABOVEZERO:

mul.s	$f14, $f14, $f3			# Multiplying the R value by the maximum 
mul.s	$f15, $f15, $f3			# Muliplying the G value by the maximum	
mul.s   $f16, $f16, $f3			# Multiplying the B value by the maximum



cvt.w.s $f14, $f14	#converting these floating point numbers back to integers. 
mfc1 $t0, $f14		#moving from coproccessor one (Floating point registers) to the CPU registers

cvt.w.s $f15, $f15	#converting these floating point numbers back to integers. 
mfc1 $t1, $f15		#moving from coproccessor one (Floating point registers) to the CPU registers

cvt.w.s $f16, $f16	#converting these floating point numbers back to integers. 
mfc1 $t2, $f16	#moving from coproccessor one (Floating point registers) to the CPU registers

sb $t0, 0($t6) 
sb $t1, 1($t6)
sb $t2, 2($t6)

addi $s4, $s4, 1	#increasing counter by 3
addi $t6, $t6, 4
blt $s4, $s5, LoopSat
j UpdateImage


FileSave:
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
sb $t2, 2($s0)        #
addi $s0, $s0, 3
addi $s1, $s1, 4

addi $s4, $s4, 1
b  loop5
end_adj5:


la $a0, OutFile    #open file
li $v0, 13
li $a1, 1
li $a2, 0
syscall
move $s7, $v0        # Store File Pointer
move $a0, $v0
li $v0, 15        #Wrtie File To Buffer
la $a1, buff    
li $a2, 786486
syscall
bgt $v0, 0, CloseOut    #if file not read brake
la $a0,FIleErrorMsg
li $a1, 2
li $v0,55
syscall
break

# Closing the file - Either input or output #
CloseOut:
move $t8, $v0         # Storing the current value of v0 into a register DO WE NEED THIS?
li   $v0, 16           # Storing syscall value for file closing
move $a0, $s7          # Setting the file pointer as an argument for the syscall
syscall                
la $a0, ImgData
jal Flip_v
jal Flip_h
j UpdateImage






