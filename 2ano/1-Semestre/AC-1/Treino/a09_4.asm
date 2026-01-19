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
	j 	for

end_for:	
	# max(a, SIZE)
	la 	$a0, a
	li 	$a1, SIZE
	jal 	max
	
	mov.d 	$f12, $f0
	li 	$v0, print_double	# print_double( max(p, SIZE) )
	syscall
	
	# print \n
	la 	$a0, str
	li 	$v0, print_string
	syscall
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
#####################

max:	
	addiu 	$t0, $a1, -1	# n–1;
	mulu 	$t0, $t0, 8 	# (n–1)*size_of(double)
	
	addu 	$t0, $a0, $t0	#  double *u = p + n–1; 
	
	l.d 	$f2, 0($a0)		# max = *p
	addiu 	$a0, $a0, 8		# p++
	
max_for:	
	bgt	$a0, $t0, max_end	# for(; p <= u; p++) 
	
	l.d	$f4, 0($a0)		# *p
	
max_if:	
	c.le.d	$f4, $f2
	bc1t	max_fim		# if(*p > max) 
	
	mov.d 	$f2, $f4	# max = *p; 
	
max_fim:	
	addiu	$a0, $a0, 8		# p++
	
	j	max_for
	
max_end:	
	mov.d	$f0, $f2
	
	jr	$ra
