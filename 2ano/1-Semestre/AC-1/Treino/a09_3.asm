	.data
sum:	.double	0.0
	.eqv	SIZE, 10
a:	.space	80
str:	.asciiz "\n"
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv print_string, 4

	.text
	.globl main

main:
	addiu 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	
 	li 	$t0, 1		# i = 0
for:	bge 	$t0, SIZE, end_for	# i < SIZE
	
	li 	$v0, read_double
	syscall			# read_double()
	
	la 	$t1, a
	mulu 	$t2, $t0, 8		# i * 8
	addu 	$t1, $t1, $t2	# a + i
	s.d 	$f0, 0($t1)		# a[i] = read_double();
	
	addiu 	$t0, $t0, 1		# i++
	j for
end_for:	
	# average(a, SIZE)
	la 	$a0, a
	li 	$a1, SIZE
	jal average
	
	mov.d 	$f12, $f0
	li 	$v0, print_double	# print_double( average(a, SIZE) )
	syscall
	
	# print \n
	la 	$a0, str
	li 	$v0, print_string
	syscall
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
	
##############################

average:
	addiu	$t0, $a1, -1	# int i = n-1; 
	
	la	$t1, sum
	l.d	$f2, 0($t1)		# double sum = 0.0; 

average_for:
	blt	$t0, 0, average_end	# for(; i >= 0; i--)
	
	mul	$t2, $t0, 8		# i * 8
	
	addu	$t2, $t2, $a0	
	l.d	$f4, 0($t2)		# array[i*8]
	
	add.d	$f2, $f2, $f4	# sum += array[i*8];
	
	addiu	$t0, $t0, -1	# i--
	
	j	average_for

average_end:
	mtc1	$a1, $f6
	cvt.d.w	$f6, $f6		# converter n em double
	
	div.d	$f0, $f2, $f6	# return sum / (double)n; 
	
	jr	$ra