	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "Valor ignorado \n"
str3:	.asciiz "A soma dos positivos e: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
		
	.text
	.globl main
main:	li $t0, 0			# soma = 0
	li $t1, 0			# i = 0
	
for:	bge $t1, 5, endfor
	
	la $a0, str1
	ori $v0, $0, print_string
	syscall				# print str1
	
	ori $v0, $0, read_int
	syscall
	or $t2, $0, $v0			# guardar o valor introduzido em $t2
	
if:	ble $t2, 0, else		# condição
	
	add $t0, $t0, $t2
	
	j endif

else:	la $a0, str2
	ori $v0, $0, print_string
	syscall				# valor ignorado
	
	j endif
	
endif:	addi $t1, $t1, 1
	j for				# i += 1, volta pro for
	
endfor:	la $a0, str3
	ori $v0, $0, print_string	
	syscall				# A soma dos positivos é: 
	
	ori $v0, $0, print_int10
	add $a0, $0, $t0
	syscall				# imprime resultado

	jr $ra