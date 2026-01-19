	.data
	
	.eqv	SIZE, 20
	.eqv	read_string, 8
	.eqv	print_int10, 1

str:	.space	21
	
	.text
	.globl main
main:
	ori	$t0, $0, 0		# num = 0
	
	la	$a0, str
	li	$a1, SIZE
	li	$v0, read_string
	syscall			# read_string(str, SIZE);
	
	la	$t1, str		# p = str
	
while:	
	lb	$t2, 0($t1)		# *p
	beq	$t2, '\0', endwhile	# while( *p != '\0' ) 
		
if:	blt	$t2, '0', skip	# if( (*p >= '0') &&
	bgt	$t2, '9', skip	# (*p <= '9') )
	
	addi	$t0, $t0, 1		# num++

skip:
	addi	$t1, $t1, 1		# p++
	
	j while

endwhile:	
	or	$a0, $0, $t0
	li	$v0, print_int10
	syscall			# print_int10(num); 
	
	jr $ra
	
# Mapa de Registos:
# $t0 = num
# $t1 = p
# $t2 = *p