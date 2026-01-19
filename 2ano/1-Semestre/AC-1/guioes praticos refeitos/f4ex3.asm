# mapa de registos
# $t0 = p
# $t1 = pultimo
# $t2 = *p
# $t3 = soma

	.data
array: 	.word 7692, 23, 5, 234
	.eqv SIZE, 4
	.eqv print_int10, 1
	.text
	.globl main
	
main:
	la $t0, array 	# p = array
	li $t3 , 0	# int soma = 0
	
	li $t4, SIZE	# t4 = size
	addi $t4, $t4, -1	# t4 = size - 1
	sll $t4, $t4, 2	# t4 = size * 4
	
	add $t1, $t0, $t4 # pultimo=array+SIZE-1;
	
while:	bgt $t0, $t1, endwhile	# while( p <= pultimo ) 

	lw $t2, 0($t0)	# int *p
	
	add $t3, $t3, $t2
	
	addiu $t0, $t0, 4  # tamos a trabalha com enederços
	# logo cada palavra tem 4 bytes e a soma tem q ser unsigned
	
	j while
endwhile:

	move $a0, $t3
	li $v0, print_int10
	syscall
							
	jr $ra