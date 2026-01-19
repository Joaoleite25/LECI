# mapa de registos
# $t0 : houveTroca
# $t1 : aux
# $t2 : *p
# $t3 : *pultimo
# $t4 : i
# $t5 : lista 
# $t6 : i * 4 ou SIZE - 1	ou p+1	TEMPORARIO
# $t7 : lista + i ou *(p+1)	TEMPORARIO
# $t8 : p
# $t9 : pultimo
	
	.data	
	.eqv SIZE, 10	# #define SIZE 10 
lista:	.space 40	# static int lista[SIZE];
	.align 2
str: 	.asciiz "\nIntroduza um numero: "
	.eqv print_int10, 1
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv TRUE, 1
	.eqv FALSE, 0
	.text
	.globl main

main:	
	li $t4, 0	 # i = 0
	
while0: 	bge $t4, SIZE, endwhile0

	la $a0, str
	li $v0, print_string 
	syscall
	
	li $v0, read_int
	syscall
	
	la $t5, lista
	
	sll $t6, $t4, 2
	
	addu $t7, $t5, $t6
	
	sw $v0, 0($t7) 
	
	addi $t4, $t4, 1 # i ++
	
	j while0
endwhile0:
	
	li $t6, SIZE
	addi $t8, $t6, -1	# SIZE - 1
	
	add $t9, $t5, $t6	# pUltimo = lista + (SIZE - 1);
	
	move $t8, $t5	# (p = lista
do:		
	li $t0, FALSE	# houveTroca = FALSE;
	
for:	
	bge $t8, $t9, endfor
	
	lw $t2, 0($t8) 	# *p
	addi $t6, $t8, 4	# p+ 1
	lw $t7, 0($t6)	# *(p+1)
	
if: 	ble $t2, $t7 , endif

	move $t1, $t2	# aux = *p;
	move $t2, $t7	# *p = *(p+1);
	sw $t2, 0($t5) 
	move $t7, $t1	# *(p+1) = aux;
	sw $t7, 0($t6) 
	li $t0, TRUE	# houveTroca = TRUE;
	
endif:
	addi $t8, $t8, 4	#  p++
endfor:				
	bne $t0, TRUE, do	
	
	li $t4, 0	# i =0
	
while1: 	bge $t4, SIZE, endwhile1
	sll $t6, $4, 2 # i*4
	addu $t7, $t5, $t6
	
	lw $a0, 0($t7)
	li $v0, print_int10
	syscall
	
	addi $t4, $t4, 1	# i ++
	
	j while1
endwhile1:			
										
	jr $ra