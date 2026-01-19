# Mapa de Registos
# n_even = 	t0
# n_odd =	t1
# p1 =	t2
# p2 =	t3
# a + N = 	t4

	.data
	
	.eqv	N, 35
	
	.align 	2
a: 	.space 	140		# 35*4
bola:	.space	140		# 35*4

	.eqv	read_int, 5
	.eqv	print_int10, 1
	
	.text
	.globl main
main:
	li	$t0, 0		# even
	li	$t1, 0		# odd
	la	$t2, a		# p1
	addiu	$t4, $t2, 140
for:	bge	$t2, $t4, endf
	li	$v0, read_int
	syscall
	sw	$v0, 0($t2)
	addiu	$t2, $t2, 4
	j	for
endf:	la	$t2, a
	la	$t3, bola
for1:	bge	$t2, $t4, endf1
	lw	$t5, 0($t2)
	rem	$t6, $t5, 2
	beq	$t6, 0, else
	sw	$t5, 0($t3)
	addiu	$t3, $t3, 4
	addiu	$t1, $t1, 1
	j	skip
else:	addiu	$t0, $t0, 1
skip:	addiu	$t2, $t2, 4
	j	for1
endf1:	la	$t3, bola
	mulu	$t4, $t1, 4
	addu	$t4, $t3, $t4
for2:	bge	$t3, $t4, endf2
	lw	$a0, 0($t3)
	li	$v0, print_int10
	syscall
	addiu	$t3, $t3, 4
	j	for2
endf2:
	
	jr	$ra