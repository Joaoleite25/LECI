	.data
	
	.eqv	read_double, 7
	.eqv	print_double, 3
	.align	3
a:	.space	80		# 10*8
sum:	.double	0.0
	.eqv	exit, 10
	.eqv	SIZE, 10		# 10*8
	
	.text
	.globl main
main:
	li	$t1, SIZE
	li	$t0, 0		# i
	la	$t2, a		# a[0]
	
for:	bge	$t0, $t1, endf	# for(i = 0; i < SIZE; i++)
	
	li	$v0, read_double
	syscall			# read_double(); 
	
	sll	$t3, $t0, 3		# i * 8
	addu	$t3, $t3, $t2	# a[i]
	sdc1	$f0, 0($t3)		# a[i] = read_double(); 
	
	addiu	$t0, $t0, 1		# i++
	j	for
endf:
	la	$a0, a
	li	$a1, SIZE
	jal	max		# max(a, SIZE) 
	
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print_double( max(a, SIZE) ); 
	
	li	$v0, exit
	syscall			# acabar o programa
	
## 	MAX
max:	
	addiu	$t0, $a1, -1
	addu	$t0, $t0, $a0	# *u = p+n–1; 
	
	l.d	$f0, 0($a0)		# max = *p++;
	addiu	$a0, $a0, 8		# p++

for1:	bgt	$a0, $t0, endf1	# for(; p <= u; p++)
	l.d	$f2, 0($a0)
	c.le.d	$f2, $f0
	bc1t	skip		# if(*p > max) 
	mov.d	$f0, $f2		# max = *p; 
	
skip:	addiu	$a0, $a0, 8		# p++
	j	for1
endf1:	

	jr	$ra