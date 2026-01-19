# Mapa de registos
# val:	$t0
# n:	$t1
# min:	$t2
# max:	$t3

	.data
	
perg:	.asciiz	"Digite ate 20 inteiros (zero para terminar):"
str:	.asciiz	"Max/Min sao: "
	
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int10, 1
	.eqv	print_char, 11
	
	.text
	.globl main
main:	
	li	$t2, 0x7FFFFFFF		# min
	li	$t3, 0x80000000		# max
	li	$t1, 0			# n = 0
	
	la	$a0, perg
	li	$v0, print_string
	syscall				# print(pergunta)
	
do:	
	li	$v0, read_int
	syscall
	or	$t0, $0, $v0		# val = read_int()
	
	beq	$t0, 0, skip0		# if (val != 0)
	
	ble	$t0, $t3, skip1		# if (val > max)
	or	$t3, $t0, $0		# max = val
	
skip1:	bge	$t0, $t2, skip0		# if (val < min)
	or	$t2, $t0, $0		# min = val
	
skip0:	
	addiu	$t1, $t1, 1			# n++
	
	bge	$t1, 20, skip2
	bne	$t0, 0, do			# while ( (n < 20) && (val != 0) )
	
skip2:	
	la	$a0, str
	li	$v0, print_string
	syscall
	
	or	$a0, $0, $t3
	li	$v0, print_int10
	syscall
	
	li	$a0, ':'
	li	$v0, print_char
	syscall
	
	or	$a0, $0, $t2
	li	$v0, print_int10
	syscall
	
	jr	$ra