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
	jal	average		# average(a, SIZE) 
	
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print_double( average(a, SIZE) ); 
	
	li	$v0, exit
	syscall			# acabar o programa
	
## 	AVERAGE
average:	
	or	$t0, $0, $a1
	addiu	$t0, $t0, -1	# int i = n-1; 
	
	la	$t1, sum
	l.d	$f0, 0($t1)		# sum = 0.0
	
	or	$t2, $a0, $0
	
for1:	blt	$t0, 0, endf1	# for(; i >= 0; i--) 
	
	l.d	$f2, 0($t2)		# array[i]
	add.d	$f0, $f0, $f2	# sum += array[i]; 
	
	addiu	$t2, $t2, 8
	addiu	$t0, $t0, -1	# i--
	j	for1
endf1:	
	mtc1	$a1, $f2
	cvt.d.w	$f2, $f2
	div.d	$f0, $f0, $f2	# return sum / (double)n;
	
	jr	$ra