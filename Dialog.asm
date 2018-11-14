.data	
buff: .space 128
Welcome: .asciiz "|   Welcome  |\n\n\n| MIPS Image Processor|\n\n***********************************\nPlease Enter One Of The Following int Values:\n\n 1.Filp H\n 2.Flip V\n 3.Color adjustments\n 4.Sobel Edge Detiction\n 5.Contrast\n 6.Reset Image\n 7.Exit\n "
InError: .asciiz "Wrong Input !\n Please Try Again"
.text
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