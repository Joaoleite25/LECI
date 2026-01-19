	.data
	
str:	.asciiz	"Teste1234"
	.eqv	print_int10, 1
	
	.text
	.globl main
main:
	la	$t0, str
	
strlen:	
	li	$t1, 0			# int len = 0;	

while:
	addu	$t2, $t0, $t1
	lb	$t2, 0($t2)
	beq	$t2, '\0', endw		# while(*s++ != '\0')
	
	addiu	$t1, $t1, 1			# len++
	
	j	while

endw:
	or	$a0, $0, $t1
	li	$v0, print_int10
	syscall				# return len
	
	jr	$ra
	
# Mapa de Registos
# $t0 = str
# $t1 = len
# $t2 = *s