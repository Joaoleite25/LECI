#define SIZE 4
#int array[4] = {7692, 23, 5, 234}; 
 				
#void main (void)
#{
# 	int soma = 0;
#	int i = 0;
#
# 	while( i < SIZE )
# 	{
# 		soma = soma + array[i];
# 		i++; 		
#	 }
# 	print_int10(soma);
#}

 
# mapa de registos
# $t0 : soma
# $t1 : i
# $t2 : array
# $t3 : array+1
# $t4 : array[i]

	.data
array: 	.word 7692, 23, 5, 234	# int array[4] = {7692, 23, 5, 234};
	.eqv SIZE, 4		# define SIZE 4
	.eqv print_int10, 1
	.text
	.globl main
	
main:
	li $t0, 0	# int soma = 0;
	li $t1, 0	# int i = 0;
	
while:	bge $t1, SIZE, endwhile	# while( i < SIZE )

	la $t2, array		# $t2 = array
	sll $t5, $t1, 2		# $t5 = i * 4		
	addu $t3, $t2, $t5 	# $t3 = array + i
	lw $t4, 0($t3)		# array[i]
	add $t0, $t0, $t4 
	
	addi $t1, $t1, 1	# i++; 	
	j while
endwhile:	
	move $a0, $t0
	li $v0, print_int10	# print_int10(soma);
	syscall
	
	jr $ra

