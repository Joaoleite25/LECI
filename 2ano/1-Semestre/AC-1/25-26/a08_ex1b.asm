# Mapa de Registos
# r = $t0
# s = $t1
# *s = $t2
# digit = $t3
	
	.data
	
str:	.asciiz	"101101"
	
	.eqv	print_int10, 1
	
	.text
	.globl main
main:
	li	$t0, 0		# res = 0;
	la	$t1, str
	
while:	
	lb	$t2, 0($t1)
	blt	$t2, '0', endw
	bgt	$t2, '9', endw	# while( (*s >= '0') && (*s <= '9') ) 
	
	addiu	$t1, $t1, 1		# s++
	
	li	$t4, '0'
	subu	$t3, $t2, $t4	# digit = *s++ - '0'; 
	
	## BINARIO ##
	mulu	$t0, $t0, 2
	addu	$t0, $t0, $t3	# res = 2 * res + digit; 
	
	j	while
	
endw:	
	or	$a0, $0, $t0
	li	$v0, print_int10
	syscall			# return res; 
	
	jr	$ra