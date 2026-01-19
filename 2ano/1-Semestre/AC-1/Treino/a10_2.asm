	.data
xn:	.double	1.0
zero:	.double	0.0
d1:	.double	0.5
	.eqv read_double, 7
	.eqv print_double, 3
	
	.text
	.globl main

main:	
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	li 	$v0, read_double
	syscall			# read_double()
	
	mov.d 	$f12, $f0
	jal	sqrt
	
	mov.d 	$f12, $f0
	li 	$v0, print_double	
	syscall			# print_double( sqrt(double val)  )
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
	
########################

sqrt:	
	la	$t1, zero
	l.d	$f2, 0($t1)		# 0.0;
	
	la	$t2, xn
	l.d	$f4, 0($t2)		# xn = 1.0;
	
	la	$t3, d1
	l.d	$f10, 0($t3)	# 0.5;
	
	li	$t0, 0		# int i = 0;
	
	c.le.d	$f12, $f2
	bc1t	sqrt_else		# if(val > 0.0)
	
sqrt_do:	
	mov.d	$f6, $f4		# aux = xn;
	
	div.d	$f8, $f12, $f4	# val/xn
	add.d	$f8, $f4, $f8	# xn + val/xn
	mul.d	$f4, $f10, $f8	# xn = 0.5 * (xn + val/xn); 
	
	c.eq.d	$f6, $f4
	bc1t	sqrt_ignore		# aux != xn
	
	addi	$t0, $t0, 1		# i++
	bge	$t0, 25, sqrt_ignore	# ++i < 25
	
	j	sqrt_do

sqrt_else:	
	mov.d	$f4, $f2		# xn = 0.0; 

sqrt_ignore:
	
	mov.d	$f0, $f4		# return xn; 
	
	jr	$ra