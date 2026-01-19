	.data
d1:	.double 	32.0
d2:	.double 	5.0
d3:	.double 	9.0
ct:	.double	0.0
d4:	.double	100.0
espaco:	.asciiz	"\n"
	
	.text
	.globl main

main:	
	la	$t0, ct
	l.d	$f20, 0($t0)	# 0.0
	
	la	$t1, d4
	l.d	$f24, 0($t1)	# 100.0
while:	
	c.le.d	$f20, $f24		
	bc1f	end		# while(ct <= 100.0)
	
	li	$v0, 7
	syscall			# ft = read_double();
	
	mov.d	$f12, $f0
	jal	f2c		# f2c(ft)
	
	mov.d	$f20, $f0		# ct = f2c(ft);
	
	mov.d	$f12, $f20
	li	$v0, 3
	syscall			# print_double(ct); 
	
	la	$a0, espaco
	li	$v0, 4
	syscall			# \n
	
	j 	while

end:	
	jr	$ra
	
###########################

f2c:	
	la	$t0, d1
	l.d	$f2, 0($t0)		# 32.0
	
	la	$t1, d2
	l.d	$f4, 0($t1)		# 5.0
	
	la	$t2, d3
	l.d	$f6, 0($t2)		# 9.0
	
	sub.d 	$f8, $f12, $f2	# (ft – 32.0)
	div.d	$f10, $f4, $f6	# 5.0 / 9.0
	mul.d	$f0, $f8, $f10	# return (5.0 / 9.0 * (ft – 32.0)); 
	
	jr	$ra