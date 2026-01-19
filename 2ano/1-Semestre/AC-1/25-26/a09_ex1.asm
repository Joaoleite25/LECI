	.data
	
	.eqv	read_int, 5
	.eqv	print_float, 2
float:	.float	2.59375
comp:	.float	0.0
	
	.text
	.globl main
main:	
	la	$t0, comp
	l.s	$f4, 0($t0)
	la	$t0, float
	l.s	$f2, 0($t0)		# 2.59375
do:	li	$v0, read_int
	syscall			# read_int(); 
	mtc1	$v0, $f0		# val = read_int();
	cvt.s.w	$f0, $f0		# (float)val
	mul.s	$f12, $f0, $f2	# res = (float)val * 2.59375;
	li	$v0, print_float
	syscall			# print_float( res ); 
	
	c.eq.s	$f12, $f4	
	bc1f	do		#  while(res != 0.0); 
	
	jr	$ra