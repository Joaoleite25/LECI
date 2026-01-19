	.data
	
	.eqv	SIZE, 15
	.eqv	print_int10, 1
	.eqv	print_string, 4
inv:	.asciiz	"Invalid argc"

	.text
	.globl func1
###	func1
	# Mapa de Registos:
	# $s0 = f1
	# $s1 = k
	# $s2 = av
	# $s3 = i
	# $s4 = res
func1:			# func1(int *f1, int k, char *av[]), $a0, $a1, $a2
	addi	$sp, $sp, -24
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)		# f1
	sw	$s1, 8($sp)		# k
	sw	$s2, 12($sp)	# av
	sw	$s3, 16($sp)	# i
	sw	$s4, 20($sp)	# res
	
	or	$s0, $a0, $0
	or	$s1, $a1, $0
	or	$s2, $a2, $0
	
if:	blt	$s1, 2, else	# k >= 2 &
	bgt	$s1, SIZE, else	# & k <= SIZE
	
	li	$s3, 2		# i = 2
do:	
	sll	$t1, $s3, 2
	addu	$a0, $s2, $t1	# av[i]
	jal	toi		# toi(av[i])
	sll	$t1, $s3, 2
	addu	$t1, $t1, $s0	# f1[i]
	sw	$v0, 0($t1)		# f1[i] = toi(av[i])
	
	addiu	$s3, $s3, 1		# i++
	blt	$s3, $s1, do	# i < k
	
	or	$a0, $s0, $0
	or	$a1, $s1, $0
	jal	avz		# avz(f1, k)
	or	$s4, $v0, $0	# res = avz(f1, k)
	
	or	$a0, $t0, $0
	li	$v0, print_int10
	syscall			# print(res)
	
	j	skip
else:	
	la	$a0, inv
	li	$v0, print_string
	syscall			# print_string("Invalid argc")
	
	li	$s4, -1		# res = -1
skip:	
	or	$v0, $s4, $0	# resturn res
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	lw	$s3, 16($sp)
	lw	$s4, 20($sp)
	addiu	$sp, $sp, 24
	jr	$ra
