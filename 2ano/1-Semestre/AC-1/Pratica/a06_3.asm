	# i : $t0
	# j: $t1
	# array[i][j]: $t3
 	.eqv SIZE,3
 	.eqv print_string, 4
 	.eqv print_char, 11
 	
 	.data
array:	.word str1, str2, str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"

 	.text
 	.globl main
main:	la $t1, array			# $t1 = p = &array[0] = array
	li $t0, SIZE			# 
	sll $t0,$t0,2			# 
	addu $t2,$t1,$t0		# $t2 = pultimo = array + SIZE
for: 	bge $t0, $t2, endf
	lw $a0, 0($t1)			# $a0 = array[i]
 	li $v0, print_string
 	syscall
 	li $a0,'\n'
 	li $v0, print_char
 	syscall
 	addi $t1,$t1,4
 	j for
endf:	jr $ra
while:
 	la $t3,array # $t3 = &array[0]
 	sll $t2,$t0,2 #
 	addu $t3,$t3,$t2 # $t3 = &array[i]
 	lw $t3,0($t3) # $t3 = array[i] = &array[i][0]
 	addu $t3,$t3,$t1 # $t3 = &array[i][j]
 	lb $t3,... # $t3 = array[i][j]
 	
 	
 	
 	
 	
 	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv print_int10, 1

	.data
array:	.word str1, str2, str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
msg_string: .asciiz "\nString #"
msg_colon: .asciiz ": "

	.text
	.globl main

main:
	li $t0, 0                     # i = 0 (inicialização do índice para o loop externo)

outer_loop:
	# Verifica a condição do loop externo (for i < SIZE)
	bge $t0, SIZE, end_outer      # Se i >= SIZE, termina o loop

	# print_string("\nString #");
	la $a0, msg_string
	li $v0, print_string
	syscall

	# print_int10(i);
	move $a0, $t0
	li $v0, print_int10
	syscall

	# print_string(": ");
	la $a0, msg_colon
	li $v0, print_string
	syscall

	# Configuração do loop interno (j = 0)
	li $t1, 0                     # j = 0
	lw $t2, array($t0)            # Carrega o endereço de array[i] em $t2

inner_loop:
	# Verifica se array[i][j] == '\0'
	add $t3, $t2, $t1             # Calcula o endereço de array[i][j]
	lb $a0, 0($t3)                # Carrega o byte array[i][j] em $a0
	beq $a0, $zero, end_inner     # Se array[i][j] == '\0', sai do loop interno

	# print_char(array[i][j]);
	li $v0, print_char
	syscall

	# print_char('-');
	li $a0, '-'
	li $v0, print_char
	syscall

	# j++;
	addi $t1, $t1, 1
	j inner_loop                  # Continua o loop interno

end_inner:
	# Incrementa o índice do loop externo (i++)
	addi $t0, $t0, 1
	j outer_loop                  # Continua o loop externo

end_outer:
	# Retorno do programa
	li $v0, 10                    # Chamada de sistema para encerrar o programa
	syscall
