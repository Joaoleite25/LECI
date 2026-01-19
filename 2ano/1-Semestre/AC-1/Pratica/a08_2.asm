	# Mapa de registos
	# n: $a0 -> $s0
	# b: $a1 -> $s1
	# s: $a2 -> $s2
	# p: $s3
	# digit: $t0
	.data
str:    .space 32              # Buffer para a string de saída
result: .asciiz "Resultado: "  # Mensagem de saída

	.text
	.globl main

main:
    	li $a0, 255                	# Número a ser convertido
    	li $a1, 16                 	# Base de conversão (16 para hexadecimal)
    	la $a2, str                	# Endereço do buffer de saída
    	jal itoa                   	# Chama a função itoa
    
    	li $v0, 4                  	# Código de syscall para imprimir string
    	la $a0, result             	# Endereço da mensagem
    	syscall

    	li $v0, 4                  	# Código de syscall para imprimir string
    	la $a0, str                	# Endereço da string convertida
    	syscall

    	li $v0, 10                 	# Código de syscall para sair
    	syscall

	# Sub-rotina intermédia
itoa: 	
	addiu $sp, $sp, -24       # Reserva espaço na stack
    	sw $ra, 20($sp)           # Salva $ra
    	sw $s0, 16($sp)           # Salva $s0 (n)
    	sw $s1, 12($sp)           # Salva $s1 (b)
    	sw $s2, 8($sp)            # Salva $s2 (s)
    	sw $s3, 4($sp)            # Salva $s3 (p)

    	move $s0, $a0             # n -> $s0
    	move $s1, $a1             # b -> $s1
    	move $s2, $a2             # s -> $s2

    	move $s3, $s2             # p = s;

do: 					# do {
	rem $t0, $s0, $s1
 	divu $t0, $s0, $s1        # $t0 = n / b

    	move $a0, $t0             # Passa o dígito como argumento
    	jal toascii               # Chama toascii

    	sb $t1, 0($s3)            # *p = toascii(digit)
    	addiu $s3, $s3, 1         # p++
    	
	bgt $s0, 0, do

    	sb $zero, 0($s3)          # *p = '\0'

    	move $a0, $s2             # Passa o endereço da string s
    	jal strrev                # Chama strrev

    	move $v0, $s3             # Retorna s

    	lw $ra, 0($sp)           # Restaura $ra
    	lw $s0, 4($sp)           # Restaura $s0
    	lw $s1, 8($sp)           # Restaura $s1
    	lw $s2, 12($sp)            # Restaura $s2
    	lw $s3, 16($sp)            # Restaura $s3
    	addiu $sp, $sp, 24        # Libera espaço na stack
    	jr $ra                    # Retorna
    	
toascii:
    	addiu $a0, $a0, '0'       # v += '0'
    	ble $a0, '9', return # Se v <= '9', retorna
    	addiu $a0, $a0, 7         # Para v > '9', v += 7 ('A' - '9' - 1)

return:
    	move $v0, $a0             # Retorna o caractere convertido
    	jr $ra                    # Retorna