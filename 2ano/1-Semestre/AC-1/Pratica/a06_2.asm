	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11

	.data
array:	.word str1, str2, str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"

	.text
	.globl main
main:	la $t1, array               # $t1 = p = &array[0]
	li $t0, SIZE                # Carrega SIZE em $t0
	mul $t0, $t0, 4             # Multiplica SIZE * 4 (4 bytes por elemento)
	addu $t2, $t1, $t0          # $t2 = pultimo = array + SIZE * 4
for:	beq $t1, $t2, endf          # Se p >= pultimo, sai do loop
	# Carrega e imprime o valor apontado por p
	lw $a0, 0($t1)              # $a0 = *p
	li $v0, print_string        # Chamada de sistema para print_string
	syscall
	# Imprime nova linha
	li $a0, '\n'
	li $v0, print_char          # Chamada de sistema para print_char
	syscall
	# Incrementa p para o próximo elemento
	addi $t1, $t1, 4            # p++
	j for                       # Repete o loop
endf:	jr $ra                       # Retorna