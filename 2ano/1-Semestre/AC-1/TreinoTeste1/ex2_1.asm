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
	la	$t2, val
do:	lw	$t1, 0($t2)		# v = val[i]
	lw	$t3, 4($t2)
	sw	$t3, 0($t2)		# val[i] = val[i + SIZE/2]
	sw	$t1, 4($t2)		# val[i + SIZE/2] = val[i]
	
	addiu	$t0, $t0, 1		# i++
	addiu	$t2, $t2, 4	 
	
	blt	$t0, 4, do		# while(++i < (SIZE/2))
	
	la	$a0, str
	li	$v0, print_string
	syscall			# result is
	
	li	$t0, 0		# i = 0
	la	$t2, val
do1:	lw	$a0, 0($t2)
	li	$v0, print_int10
	syscall
	li	$a0, ','
	li	$v0, print_char
	syscall
	addiu	$t0, $t0, 1
	addiu	$t2, $t2, 4
	blt	$t0, 8, do1
	
	jr	$ra