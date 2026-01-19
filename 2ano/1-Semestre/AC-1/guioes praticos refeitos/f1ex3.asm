	.data
	
	.text
	.globl main
	
main: 	ori $v0,$0,5 		#syscall read int
	syscall
	
	or $t0,$0, $v0  	#$t0 = $v0 (valor da syscall)
	ori $t2,$0, 8 		#$t2 = 8
	add $t1,$t0,$t0		#$t1 = $t0 + $t0 = x + x = 2 *x
	sub $t1,$t1,$t2		#$t1 = $t1 + $t2 = y = 2*x + 8
	
	or $a0,$0,$t1		#$a0 = $t1 = y
	ori $v0,$0,1		#syscall print int 10
	syscall
	
	ori $v0,$0, 11		#syscall print char
	ori $a0,$0, '\n'	#mudar de linha
	syscall
	
	or $a0,$0,$t1		#$a0 = $t1 = y
	ori $v0,$0,34		#syscall print int 16
	syscall
	
	ori $v0,$0, 11		#syscall print char
	ori $a0,$0, '\n'	#mudar de linha
	syscall
	
	or $a0,$0,$t1		#$a0 = $t1 = y
	ori $v0,$0,36		#syscall print intu 10
	syscall
	
	jr $ra			#fim do programa