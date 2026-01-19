	.data
prompt: .asciiz "Digite a temperatura em Fahrenheit: " 		# Mensagem para o usuário
line: 	.asciiz "\n" 						# Nova linha
zeroC: 	.double 0.0 						# Valor inicial de Celsius
uL: 	.double 100.0 						# Limite de 100.0 graus Celsius
c5: 	.double 5.0 						# Constante 5.0
c9: 	.double 9.0 						# Constante 9.0
c32: 	.double 32.0 						# Constante 32.0
	
	.text
	.globl main

main:
    	la $a0, zeroC 			# Carregar endereço de zeroCelsius
    	ldc1 $f2, 0($a0) 		# Carregar 0.0 em $f2 (ct)

while_loop:
    	la $a0, uL 			# Carregar endereço do limite superior (100.0)
    	ldc1 $f4, 0($a0) 		# Carregar 100.0 em $f4
    	c.le.d $f2, $f4 		# Comparar ct ($f2) <= 100.0
    	bc1f end_loop 			# Sair do loop se ct > 100.0
	
    	li $v0, 4 			# syscall para imprimir string
    	la $a0, prompt 			# Carregar endereço da mensagem
    	syscall 

    	li $v0, 7 			# syscall para ler double
    	syscall 			# Executar syscall
    	mov.d $f12, $f0 		# Armazenar entrada em $f12 (ft)
	
    	jal f2c 			# Chamar a função f2c
    	mov.d $f2, $f0 			# Armazenar retorno da função em $f2 (ct)

    	li $v0, 3 			# syscall para imprimir double
    	mov.d $f12, $f2 		# Mover ct para $f12
    	syscall

    	li $v0, 4 			# syscall para imprimir nova linha
    	la $a0, line 			# Carregar endereço da nova linha
    	syscall

    	j while_loop
	
end_loop:
    	li $v0, 10 			# syscall para encerrar o programa
    	syscall

# Função f2c: Converte Fahrenheit para Celsius
f2c:
    	ldc1 $f0, c32 			# Carregar 32.0 em $f0
    	sub.d $f12, $f12, $f0 		# ft - 32.0 (em $f12)
    	ldc1 $f2, c5 			# Carregar 5.0 em $f2
    	ldc1 $f4, c9 			# Carregar 9.0 em $f4
    	div.d $f2, $f2, $f4 		# Calcular 5.0 / 9.0
    	mul.d $f0, $f2, $f12 		# Multiplicar (5.0 / 9.0) * (ft - 32.0)
    	jr $ra 