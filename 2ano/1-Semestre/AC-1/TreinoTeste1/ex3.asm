# Mapa de Registos
# n_even = 	t0
# n_odd =	t1
# p1 =	t2
# p2 =	t3
# a + N = 	t4

	.data
	
	.eqv	N, 35
	
	.align 	2
a: 	.space 	280		# 35*4 + 35*4

	.eqv	read_int, 5
	.eqv	print_int10, 1
	
	.text
	.globl main
main:	
	li	$t0, 0		# even = 0
	li	$t1, 0		# odd = 0
	la	$t2, a		# p1 = a
	addiu	$t4, $t2, 35	# a + N
	
for1:	bge	$t2, $t4, endf1	# for (p1 < (a + N))
	li	$v0, read_int
	syscall
	sw	$v0, 0($t2)		# *p1 = read_int()
	addiu	$t2, $t2, 4		# p1++
	
	j	for1
endf1:	
	la	$t2, a		# p1 = a
	addiu	$t3, $t2, 140	# p2 = b

for2:	bge	$t2, $t4, endf2	# for (p1 < (a + N))
	lw	$t5, 0($t2)
	rem	$t6, $t5, 2
	beq	$t6, 0, else	# if ((*p1 % 2) != 0)
	sw	$t5, 0($t3)		# *p2 = *p1
	addiu	$t3, $t3, 4		# p2++
	addiu	$t1, $t1, 1		# odd++
	
	j	skip

else:	addiu	$t0, $t0, 1		# even++

skip:	addiu	$t2, $t2, 4		# p1++
	
	j	for2
endf2:
	la	$t3, a		
	addiu	$t3, $t3, 140	# p2 = b
	mulu	$t4, $t1, 4
	addu	$t4, $t3, $t4
	
for3:	bge	$t3, $t4, endf3	# for (p2 < (b + n_odd))
	
	lw	$a0, 0($t3)
	li	$v0, print_int10
	syscall			# print_int10(*p2)
	
	addiu	$t3, $t3, 4		# p2++
	
	j	for3
endf3:
	
	jr	$ra