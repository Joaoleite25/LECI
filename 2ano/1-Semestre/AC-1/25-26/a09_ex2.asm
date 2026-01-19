	.data
	
	.eqv	read_int, 5
	.eqv	print_double, 3
f1:	.double	32.0
f2:	.double	9.0
f3:	.double	5.0
	.eqv	exit, 10
	
	.text
	.globl main
main:
	li	$v0, read_int
	syscall			# read_int(); 
	mtc1	$v0, $f0		# val = read_int();
	cvt.d.w	$f12, $f0		# (double)val
	jal	f2c
	
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print_double( res ); 
	
	li	$v0, exit
	syscall			# acabar o programa
	
## 	F2C
f2c:	
	mov.d	$f0, $f12		# ft
	la	$t0, f1
	l.d	$f2, 0($t0)		# 32.0
	la	$t0, f2
	l.d	$f4, 0($t0)		# 9.0
	la	$t0, f3
	l.d 	$f6, 0($t0)		# 5.0
	
	sub.d	$f0, $f0, $f2	# (ft – 32.0)
	div.d	$f6, $f6, $f4	# 5.0 / 9.0 
	mul.d	$f0, $f0, $f6	# return (5.0 / 9.0 * (ft – 32.0)); 
	
	jr	$ra