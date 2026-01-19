	# Mapa de registos
	# $t0 0 SIZE
	# 
	# 
	# $t3 = SIZE - 1
	# houve_troca: $t4
	# i: $t5
	# lista: $t6
	# lista + i: $t7
	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
lista:	.space 40          		# Reserva espaço suficiente para 10 inteiros (4 bytes cada)
str:	.asciiz "\nIntroduza um numero: "
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.text
	.globl main
main:	
    	li $t5, 0                    	# Inicializa o índice i = 0
	
while:	
    	bge $t5, SIZE, endw           	# Se i >= SIZE, finaliza o loop
	
	la $a0, str
	li $v0, print_string
	syscall			       # print string
	
	li $v0, read_int
	syscall                        # Lê um número e armazena em $v0
	
	la $t6, lista                  # Carrega o endereço base de lista em $t6
	sll $t2, $t5, 2                # Calcula o deslocamento multiplicando o índice $t5 por 4
	addu $t7, $t2, $t6             # Calcula o endereço de lista[i]
	sw $v0, 0($t7)                 # Armazena o valor lido em lista[i]
	
	addi $t5, $t5, 1               # Incrementa o índice i
	
	j while
	
endw:	
	la $t6, lista

do:	
    	li $t4, FALSE
    	li $t5, 0
    	li $t0, SIZE
    	li $t1, 1
    	
    	sub $t3, $t0, $t1
    	
for:	
	bge $t5, $t3, endfor
	
if:	
	sll $t2, $t5, 2
	addu $t7, $t2, $t6
	lw $t8, 0($t7)
	lw $t9, 4($t7)
	
	ble $t8, $t9, endif
	
	sw $v0, 0($t7)
	sw $v1, 4($t7)
	
	li $t4, TRUE
	
endif:	
	addiu $t5, $t5, 4
	
	beq $t4, TRUE, do

endfor:	
	
	la $a0, str1
	li $v0, print_string
	syscall
	
	la $t0, lista			# $t0 = lista
	li $t3, SIZE			# $t3 = SIZE
	sll $t3, $t3, 2
	addu $t2, $t0, $t3		# $t2 = lista + SIZE
	
while1:	bgeu $t0, $t2, endw1

	lw $a0, 0($t0)
	li $v0, print_int10
	syscall
	
	la $a0, str2
	li $v0, print_string
	syscall
	
	addiu $t0, $t0, 4
	
	j while1
	
endw1:	jr $ra