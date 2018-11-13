.data
imageName: .asciiz "car.arw"
address: .word 0x10040000
buffer: .word 0
size: .word 4096

.text

imageInput:

	# Opening file #
	la $a0, imageName
	li $a1, 0
	li $a2, 0
	li $v0, 13
	syscall
	move $t1, $v0
	
	la $a3, size
	
	# Setting parameter before entering loop #
	move $a0, $t1
	la $a1, buffer
	li $a2, 3
	la $t9, address
	
	j loop
	
	
	li $v0, 10
	syscall
	
loop:

	beq $a3, $zero, closeFile
	
	li $v0, 14
	syscall
	
	lw $t0, 0($a1)
	sw $t0, 0($t9)
	
	addi $t8, $t8, 4
	addi $a3, $a3, -1
	
	j loop
	
closeFile:

	li $v0, 16
	move $a0, $t1
	syscall
	
	jr $ra
	
	