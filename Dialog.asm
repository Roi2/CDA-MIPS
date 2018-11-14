.data 0x10010000


.data 0x10110000

ImgData: .space 1048576 

.data 0x10210000
buff: .space 786486 	

filename: .asciiz "lena.bmp"
.data	
Welcome: .asciiz "|   Welcome  |\n\n\n| MIPS Image Processor|\n\n***********************************\nPlease Enter One Of The Following int Values:\n\n 1.Filp H\n 2.Flip V\n 3.Color adjustments\n 4.Sobel Edge Detiction\n 5.Contrast\n 6.Reset Image\n 7.Exit\n "
InError: .asciiz "Wrong Input !\n Please Try Again"
FIleErrorMsg: .asciiz "File Error\nterminating program..."
.text
la $a0, filename	#open file
li $v0, 13
li $a1, 0
li $a2, 0
syscall
move $s1, $v0		# Store File Pointer
move $a0, $v0
li $v0, 14		#Read File To Buffer
la $a1, buff
li $a2, 786486
syscall
bgt $v0, 0, fpnull	#if file not read brake
la $a0,FIleErrorMsg
li $a1, 2
li $v0,55
syscall
break
fpnull:
move $s5, $v0
# Close the file 
li   $v0, 16       	
move $a0, $s6      	# 
syscall            	# close file

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
sb $s2, ($s1)		# 
addi $s1, $s1, 1

lbu $s2, ($s0)		# 
addi $s0, $s0, 1
sb $s2, ($s1)		# 
addi $s1, $s1, 1

sb $zero, ($s1)		# 
addi $s1, $s1, 1

addi $s4, $s4, 1
b  loop
end_adj:

move $s4, $zero		# i = 0

subi $s0, $s1, 4	#
la $s1, ImgData		#

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
jal flip_horizontal
b printi

printi:
la $s1, ImgData		#
li $s3, 0x10010000	#
move $s4, $zero		# i = 0

loop2:
bge $s4, $s5, menu
lw $s2, ($s1)
sw $s2, ($s3)
addi $s1, $s1, 4
addi $s3, $s3, 4
addi $s4, $s4, 1
b loop2
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
beq $t0,$t1, ColorAdj
li $t0, 4
beq $t0,$t1, EdgeD
li $t0, 5
beq $t0,$t1, Contrast
li $t0, 6
beq $t0,$t1, Reset
li $t0, 7
beq $t0,$t1, Exit

InputError:
la $a0,InError
li $a1, 2
li $v0,55
syscall
j menu

FilpH:
j menu

FilpV:


j menu

ColorAdj:
j menu

EdgeD:
j menu

Contrast:
j menu

Reset:
j menu

Exit:
li $v0 ,10
syscall
j menu
flip_horizontal:
move $t5, $0		# j = 0

loop_coluna:
bge $t5, 512, end_colunas

move $t0, $a0		# x = 0, y = 0
mulo $t6, $t5, 2048	# 
add $t0, $t0, $t6
addi $t1, $t0, 2044	# 

move $t4, $0		# i = 0
loop_linha:
bge $t4, 256, end_linha
lw $t2, ($t0)		# swap
lw $t3, ($t1)
sw $t3, ($t0)
sw $t2, ($t1)

addi $t0, $t0, 4
subi $t1, $t1, 4

addiu $t4, $t4, 1	# i ++
j loop_linha
end_linha:


addi $t5, $t5, 1	# j++
j loop_coluna
end_colunas:

jr $ra
