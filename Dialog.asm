.data 0x10010000

#Space asigned for MIPS BitMap
.data 0x10110000

ImgData: .space 1048576

.data 0x10210000
buff: .space 786486     

filename: .asciiz "tesla.bmp"
OutFile: .asciiz "test.bmp"
.data    
Welcome: .asciiz "|             Welcome             |\n\n\n| MIPS Image Processor |\n\n***********************************\nPlease Select Your Option:\n\n 1.Filp Horizontally\n 2.Flip Vertically\n 3.Brightness\n 4.Hue\n 5.Vibrance\n 6.Saturation\n 7.Sobel Edge Detection\n 8.Reset Image\n 9.Save File \n 10.Exit\n "
InError: .asciiz "Wrong Input!\nPlease Try Again"
FIleErrorMsg: .asciiz "File Error\nTerminating program..."
red_hue: .asciiz "Please Enter a ine (0 - 255) to mod red by"
green_hue: .asciiz "Please Enter a ine (0 - 255) to mod green by"
blue_hue: .asciiz "Please Enter a ine (0 - 255) to mod blue by"
B_string: .asciiz "Please Enter a precentage in Dec format (-1.0 <-> 1.0) :"
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

bgt $v0, 0, fpnull    # Checking if the file was successfully opened
la $a0,FIleErrorMsg    # Loading error message as argument
li $a1, 2        # Setting warning message as argument
li $v0,55        # Storing syscall value for dialog message
syscall

break             # Breaking out of the program

# If file was successfully opened, continue here #
fpnull:
move $s5, $v0

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

loop:
beq $s4, $s5, end_adj    

lbu $s2, ($s0)        
addi $s0, $s0, 1
sb $s2, ($s1)        
addi $s1, $s1, 1

lbu $s2, ($s0)        
addi $s0, $s0, 1
sb $s2, ($s1)        #
addi $s1, $s1, 1

lbu $s2, ($s0)        #
addi $s0, $s0, 1
sb $s2, ($s1)        #
addi $s1, $s1, 1

sb $zero, ($s1)        #
addi $s1, $s1, 1

addi $s4, $s4, 1
b  loop
end_adj:

li $s4, 0   # i = 0

subi $s0, $s1, 4    #
la $s1, ImgData        #

loop3:
bge $s4, $s5, inverte
lw $s2,($s0)
lw $s3,($s1)
sw $s2,($s1)
sw $s3,($s0)
addi $s1, $s1, 4
subi $s0, $s0, 4
addi $s4, $s4, 2
j loop3
inverte:

la $a0, ImgData
jal Flip_h
b UpdateImage

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
beq $t0,$t1, Sobel
li $t0, 8
beq $t0,$t1, Reset
li $t0, 9
beq $t0,$t1,SaveBMP
li $t0, 10
beq $t0,$t1, Exit
InputError:
la $a0,InError
li $a1, 2
li $v0,55
syscall
j menu

FilpH:
la $a0, ImgData
jal Flip_h
j UpdateImage

FilpV:
la $a0, ImgData
jal Flip_v
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
j menu

Saturation:
j menu
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

loop_coluna:
bge $t5, 512, end_colunas

move $t0, $a0        # x = 0, y = 0
mulo $t6, $t5, 2048    #
add $t0, $t0, $t6
addi $t1, $t0, 2044    #

move $t4, $0        # i = 0
loop_linha:
bge $t4, 256, end_linha
lw $t2, ($t0)        # swap
lw $t3, ($t1)
sw $t3, ($t0)
sw $t2, ($t1)

addi $t0, $t0, 4
subi $t1, $t1, 4

addiu $t4, $t4, 1    # i ++
j loop_linha
end_linha:


addi $t5, $t5, 1    # j++
j loop_coluna
end_colunas:

jr $ra
Flip_v:
li $t5, 0
flip_vert:
bge $t5, 256, end_flip_vert

move $t0, $a0        # x0, y0
addi $t1, $t0, 1046528    # x0, y min;

mulo $t6, $t5, 2048    # ajusta linha
add $t0, $t0, $t6    # t0 = linha (j)

sub $t1, $t1, $t6    # t1 = -linha (j)+512


move $t4, $0        # i = 0
swap:
bge $t4, 512, end_swap
lw $t2, ($t0)        # swap
lw $t3, ($t1)
sw $t3, ($t0)
sw $t2, ($t1)

addi $t0, $t0, 4
addi $t1, $t1, 4

addiu $t4, $t4, 1    # i ++
j swap
end_swap:


addi $t5, $t5, 1    # j++
j flip_vert
end_flip_vert:
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
li $v0, 1
move $a0, $t0
syscall
move $a0, $t1
syscall
move $a0, $t2
syscall
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
	blt $s4,262144,loop_hue
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
	blt $s4,262144,loop_b
	j UpdateImage
FileSave:

la $a0, OutFile    #open file
li $v0, 13
li $a1, 1
li $a2, 0
syscall
move $s7, $v0        # Store File Pointer
move $a0, $v0
li $v0, 15        #Wrtie File To Buffer
la $a1, ImgData    
li $a2, 1048576
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

jr $ra



