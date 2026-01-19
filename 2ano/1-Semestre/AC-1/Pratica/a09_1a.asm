	.data
prompt: .asciiz "Digite um número inteiro: "
line:	.asciiz "\n"
const: 	.float 2.59375  		# Constante armazenada na memória
zero: 	.float 0.0          		# Zero armazenado para comparação
	.text
	.globl main

main:
	
loop:
    	li $v0, 4            		# syscall para imprimir string
    	la $a0, prompt       		# carregar endereço da string
    	syscall

    	li $v0, 5            		# syscall para ler inteiro
    	syscall
    	move $t0, $v0        		# armazenar o valor lido em $t0

    	mtc1 $t0, $f4        		# mover inteiro para o registrador de ponto flutuante $f4
    	cvt.s.w $f4, $f4     		# converter de inteiro para float

    	la $t1, const     		# carregar endereço da constante
    	lwc1 $f6, 0($t1)     		# carregar valor float constante para $f6

    	mul.s $f8, $f4, $f6  		# multiplicar $f4 (entrada convertida) por $f6 (constante)

    	li $v0, 2            		# syscall para imprimir float
    	mov.s $f12, $f8      		# mover resultado para $f12
    	syscall

    	li $v0, 4
    	la $a0, line
    	syscall

    	la $t2, zero         		# carregar endereço do zero
    	lwc1 $f10, 0($t2)    		# carregar valor zero para $f10

    	c.eq.s $f8, $f10     		# comparar $f8 com 0.0
    	bc1t end             		# se igual, sair do loop
	
    	j loop               		# continuar no loop

end:
    	li $v0, 10           		# syscall para encerrar o programa
    	syscall
