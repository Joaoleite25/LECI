# Mapa de registos:
# soma: $t0
# value: $t1
# i: $t2

	.data
str1:	.asciiz "Introduza um numero: "
str2:   .asciiz "Valor ignorado\n"
str3:   .asciiz "A soma dos positivos e': "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1

	.text
	.globl main
	
main:
	li $t0, 0	# soma = 0
	li $t2, 0	# i = 0
	
for: 	bge $t2, 5, endfor 	#salta se greater or equal (5) to endfor

	la $a0, str1 
	ori $v0, $0, print_string #print_string("Introduza um numero: ");
	syscall
	
	ori $v0, $0, read_int 	#value = read_int();
	syscall
	or $t1, $0, $v0		# $t1 = $v0 (v0 sai do syscall)
	
if:	ble $t1, 0, else 	 #salta if <= 0 to endif
	add $t0, $t0, $t1	 #soma = soma + value; 
	j endif			#jump pra nao fazer o else
	
else:
	la $a0, str2			# a0 = adress str2
	ori $v0, $0, print_string 	#print_string("Introduza um numero: ");
	syscall

endif:
	addi $t2, $t2, 1		# i++
	j for				#voltar a repetir o for
endfor:
	la $a0, str3			# a0 = adress str3
	ori $v0, $0, print_string 	#print_string("A soma dos positivos e': "); 
	syscall
	
	or $a0, $0, $t0			# a0 = t0 pra entrar na syscall
	ori $v0, $0, print_int10	#print_int10(soma); 
	syscall
	
	jr $ra