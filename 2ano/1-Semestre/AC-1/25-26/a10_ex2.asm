	.data
	
	.eqv	exit, 10
	.eqv	read_double, 7
	.eqv	print_double, 3
xn:	.double	1.0
zero:	.double	0.0
multi:	.double	0.5
	
	.text
	.globl main
main:	
	li	$v0, read_double
	syscall			# read_double
	
	mov.d	$f12, $f0	
	jal	sqrt		# double sqrt(double val)
	
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print(resultado)
	
	li	$v0, exit
	syscall
	
##	sqrt
sqrt:				# $f12 = val
	la	$t0, xn
	l.d	$f0, 0($t0)		# xn
	la	$t0, zero		
	l.d	$f2, 0($t0)		# 0.0
	la	$t0, multi
	l.d	$f8, 0($t0)		# 0.5
	li	$t0, 0		# i = 0
	
if:	c.le.d	$f12, $f2
	bc1t	else		# if(val > 0.0) 
	
do:	mov.d	$f4, $f0		# aux = xn;
	
	div.d	$f6, $f12, $f0
	add.d	$f6, $f6, $f0
	mul.d	$f0, $f8, $f6	# xn = 0.5 * (xn + val/xn); 
	
	c.eq.d	$f4, $f0
	bc1t	endif		# while((aux != xn) &
	addiu	$t0, $t0, 1		# i++
	blt	$t0, 25, do		# & (++i < 25));

	j	endif

else:	
	mov.d	$f0, $f2		# xn = 0.0; 

endif:	
	jr	$ra