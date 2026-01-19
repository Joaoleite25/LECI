# mapa de registos
# $t0 : i
# $t1 : lista
# $t2 : lista + i
# $t3 : i * 4
	
	.data
	.eqv SIZE, 5
lista: 	.space 20	# 5 * 4	static int lista[SIZE];
str:	.asciiz "\nIntroduza um numero: "
	.eqv print_string, 4
	.eqv read_int, 5
	.text
	.globl main
	
main:
	li $t0 , 0	# i=0
	
while:	bge $t0, SIZE, endwhile	# i < SIZE
	
	la $a0, str
	li $v0, print_string
	syscall 			# print_string(str); 
	
	li $v0, read_int
	syscall			# lista[i] = read_int(); 
	
	la $t1, lista	# $t1 = lista	
	sll $t3, $t0, 2	# i * 4
	
	addu $t2, $t1, $t3 # lista + i q é a msm coisa q lista[i]
	
	sw $v0, 0($t2)
	
	addi $t0,$t0,1	# i++
	
	j while
endwhile:


	jr $ra
	