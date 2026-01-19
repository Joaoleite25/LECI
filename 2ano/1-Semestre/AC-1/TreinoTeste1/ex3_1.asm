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
	addiu	$t4, $t2, 35	# a + N
for:	bge	$t2, $t4, endf	# p1 < (a + N)
	li	$v0, read_int
	syscall	
	sw	$v0, 0($t2)		# *p1 = read_int
	addiu 	$t2, $t2, 4		# p1++
	j	for
endf:	
	la	$t2, a		# p1
	la	$t3, bola		# p2
for1:	bge	$t2, $t4, endf1	# p1 < (a + N)
	lw	$t5, 0($t2)
	rem	$t6, $t5, 2
if:	beq	$t6, 0, else	# if((*p1%2) != 0)
	sw	$t5, 0($t3)		# *p2 = *p1
	addiu	$t3, $t3, 4		# p2++
	addiu	$t1, $t1, 1		# odd++
	j	skip
else:	addiu	$t0, $t0, 1		# even++
skip:	addiu	$t2, $t2, 4		# p1++
	j	for1
endf1:	
	la	$t3, bola		# p2
	mulu	$t5, $t1, 4
	addu	$t5, $t3,$t5 	# b + odd
for2:	bge	$t3, $t5, endf2	# p2 < (b + odd)
	lw	$a0, 0($t3)
	li	$v0, print_int10
	syscall			# print_int10(*p2)
	addiu	$t3, $t3, 4		# p2++
	j	for2
endf2:
	
	jr	$ra