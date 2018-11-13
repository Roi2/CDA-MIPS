.data
	start: 			.asciiz  "This Program that will add filters to a picture\n\n"
	enterFileName		.asciiz  "Please enter the name of the picture you would like to use:"
	enterOutFileName	.asciiz  "Please enter the name of the output File"
	selectFilter		.asciiz  "which fiter would you like to use\n\nPlease make a selection from\n 1-Hue\n2-Vibrance\n3-Brightness\n4-Saturation\n5-Sobel Edge Detection"
	
	inFile			.space	256
	outFile 		.space 256


.text
	li	$t0, 0
	li	$t1, 64		#size of the output file
	li	$t2, '\n'	
	
	# output start to screen 
	li 	$v0,4
	la	$a0,start
	syscall 
	
	# output enterFileName to screen
	li 	$v0,4
	la	$a0,enterFileName
	syscall
	
	
	# get filename from user and store in fileName
	li	$v0,8
	la	$a0,inFile
	li	$a1,64
	syscall
	
	
	# output to screen enterOutFileName
	li 	$v0,4
	la	$a0,enterOutFileName
	syscall 
	
	# get output filename from user and store in outFileName
	li	$v0,8
	la	$a0,OutFile
	li	$a1,64
	syscall
	
outputRemoveNewLine:
	beq	$t1,$zero, cont				# keep decrementing until size is zero
	subu	$t1, $t1, 1				# decrement 1 from the size
	lb	$t0, outFile($t1)			# load the character at current index position
	bne	$t0, $t2, outputRemoveNewLine		# check if char == '\n' if so continue, else do loop again
	li	$t2, 0					# store 0 in t2 as null character
	sb	$t0, outName($t1) 			# replace newline with null
	
	
pickFilter:	
 	
 	
        #output to screen SelectFilter
        
	li		$v0, 4	
	la		$a0, selectFilter	
	syscall
	
	# get input from user as an int
	
	li		$v0, 5	
	syscall
	
	
	# check if the user entered an int from 1-5...
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	