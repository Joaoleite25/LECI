	.data
	
	.eqv	SIZE, 4
	.eqv	print_int10, 1
	
array:	.word	7692, 23, 5, 234
	
	.text
	.globl main
main:	
	ori	$t0, $0, 0		# soma = 0
	
	la	$t1, array		# p = array;
	
	li	$t3, SIZE
	addiu	$t3, $t3, -1	# SIZE - 1
	sll	$t3, $t3, 2		# (SIZE - 1) * 4
	addu	$t3, $t1, $t3	# pultimo = array + SIZE-1;
	
while:	
	bgtu	$t1, $t3, endwhile	# while( p <= pultimo ) 
	
	lw	$t2, 0($t1)		# *p = word
	add	$t0, $t0, $t2	# soma = soma + (*p); 
	addiu	$t1, $t1, 4		# p++;
	
	j	while
	
endwhile:
	or	$a0, $0, $t0
	li	$v0, print_int10
	syscall			# print_int10(soma);
	
	jr $ra
	
# Mapa de Registos:
# $t0 = soma
# $t1 = p
# $t2 = *p
# $t3 = pultimo