	.data
f1:	.float 2.59375
f2:	.float 0.0
	
	.text
	.globl main

main:	
	la	$t1, f1
	l.s	$f2, 0($t1)		# 2.59375
	
	la	$t2, f2
	l.s	$f4, 0($t2)		# 0.0
	
do:	
	li	$v0, 5
	syscall
	move	$t0, $v0		# val = read_int(); 
	
	mtc1	$t0, $f6		
	cvt.s.w	$f6, $f6		# $f6 = (float)val
	
	mul.s	$f8, $f6, $f2	# res = (float)val * 2.59375; 
	
	mov.s	$f12, $f8
	li	$v0, 2
	syscall			# print_float( res );
	
while:	
	c.eq.s	$f8, $f4
	bc1f	do	# while(res != 0.0); 
	
	jr 	$ra
	
###########################