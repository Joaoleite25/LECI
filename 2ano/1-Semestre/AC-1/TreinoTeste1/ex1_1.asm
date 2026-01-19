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
	li	$t1, 0		# n
	li	$t2, 0x7FFFFFFF	# min
	li	$t3, 0x80000000	# max
	
	la	$a0, perg
	li	$v0, print_string
	syscall			# pergunta
	
do:	li	$v0, read_int
	syscall
	or	$t0, $v0, $0	# val
	
if:	beq	$t0, 0, endif	# if (val!=0)
	
if1:	ble	$t0, $t3, if2	# val>max
	or	$t3, $t0, $0	# max = val
if2:	bge	$t0, $t2, endif	# val<min
	or	$t2, $t0, $0	# min = val
endif:	
	addiu	$t1, $t1, 1		# n++
	
	bge	$t1, 20, enddo
	bne	$t0, 0, do		# (n < 20) && (val != 0)
enddo:	
	
	la	$a0, str
	li	$v0, print_string
	syscall			# max/min sao:
	
	or	$a0, $t3, $0
	li	$v0, print_int10
	syscall			# max
	
	li	$a0, ';'
	li	$v0, print_char
	syscall			# ;
	
	or	$a0, $t2, $0
	li	$v0, print_int10
	syscall			# min
	
	jr	$ra
