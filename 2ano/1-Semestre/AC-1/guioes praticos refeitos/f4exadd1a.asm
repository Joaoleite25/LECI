# mapa de registos
# $t0 : p
# $t1 : *p

	.data
	.eqv SIZE, 20	# define SIZE 20 
str:	.space 21	# static char str[SIZE+1];
str1:	.asciiz "Introduza uma string: "
	.eqv read_string, 8
	.eqv print_string, 4
	.text
	.globl main

main:
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Introduza uma string: "); 
	
	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall		# read_string(str, SIZE);
	
	la $t0, str	# p = str; 
while:	
	lb $t1, 0($t0)	# *p
	beq $t1, '\0', endwhile 	# while (*p != '\0') 
	
	li $t2, 0x20	# 'a'-'A'=0x20
	
	sub $t1, $t1, $t2	# *p = *p – 'a' + 'A';
	
	sb $t1, 0($t0)	# guardar conteudo na memoria
	
	addi $t0, $t0, 1	# p++; 
			
	j while
endwhile:
	la $a0, str
	li $v0, print_string	# print_string(str); 
	syscall 
	
	jr $ra