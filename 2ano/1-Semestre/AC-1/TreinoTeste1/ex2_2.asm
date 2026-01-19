# Mapa de registos
# i:	$t0
# v:	$t1
# &(val[0]):	$t2

	.data
	
	.eqv	SIZE, 8
	
	.align	2
val:	.word	8, 4, 15, -1987, 327, -9, 27, 16
str:	.asciiz	"Result is: "
	
	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	print_char, 11
	
	.text
	.globl main
main:	
	li	$t0, 0		# i = 0
	la	$t2, val		# val
do:	mulu	$t4, $t0, 4
	addu	$t5, $t2, $t4
	lw	$t1, 0($t5)		# v
	addiu	$t3, $t2, 16
	lw	$t4, 0($t3)		# Se vermos que o SIZE na vdd é 8*4
	sw	$t4, 0($t5)		# val[i] = val[i+SIZE/2]
	sw	$t1, 0($t3)		# val[i+SIZE/2] = v
	addiu	$t0, $t0, 1		# i++
	blt	$t0, 4, do		# while(i < (SIZE/2))
	la	$a0, str
	li	$v0, print_string
	syscall			# result is
	li	$t0, 0		# i = o
	la	$t2, val		# val
do1:	mulu	$t3, $t0, 4
	addu	$t4, $t2, $t3
	lw	$a0, 0($t4)		# v
	li	$v0, print_int10
	syscall			# val[i]
	li	$a0, ','
	li	$v0, print_char
	syscall			# ','
	addiu	$t0, $t0, 1		# i++
	blt	$t0, SIZE, do1
	
	jr	$ra