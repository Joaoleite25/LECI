# Mapa de Registos
# 
# 
# 
# 
	.data
result: 	.space 32           # espaço para string convertida
msg:    	.asciiz "\nResultado: "

        	.text
        	.globl main
main:
        	li   	$a0, 45        	# n = 45
        	li   	$a1, 2         	# b = 2 (base binária)
        	la   	$a2, result    	# s = &result
        	jal  	itoa           	# chama função
        	
        	or	$t0, $v0, $0

        	# imprime texto
        	la   	$a0, msg
        	li   	$v0, 4
        	syscall

        	# imprime string convertida
        	move 	$a0, $t0       	# retorno de itoa(s)
        	li   	$v0, 4
        	syscall

        	# fim do programa
        	li   	$v0, 10
        	syscall
        	
        	jr	$ra
        	
        	
# ITOA

itoa:	
	or	$t0, $a2, $0	# char *p = s; 
	or	$t1, $0, $a0	# n
	or	$t2, $0, $a1	# b
	
do:	
	rem	$a0, $t1, $t2	# digit = n % b; 
	divu	$t1, $t1, $t2	# n = n / b;
	
	jal	toascii
	
	sb	$v0, 0($t0)		# *p++ = toascii( digit ); 
	addiu	$t0, $t0, 1		# *p++
	
	bgt	$t1, 0, do		# while( n > 0 ); 
	
	li	$t3, '0'
	sb	$t3, 0($t0)		# *p = '\0';
	
	or	$a0, $a2, $0
	jal	strrev		# strrev( s ); 
	
	## return s
	
	jr	$ra
	
# STRREV
	
strrev:
	or	$t0, $a0, $0
	addu	$t1, $t0, $t4
	addiu	$t1, $t1, -1
	
	
while4:
	bge	$t0, $t1, endw4
	
	lb	$t2, 0($t0)
	lb	$t3, 0($t1)
	
	sb	$t2, 0($t1)
	sb	$t3, 0($t0)
	
	addiu	$t0, $t0, 1
	addiu	$t1, $t1, -1
	
	j	while4
	
endw4:	
	jr	$ra
	
	##

#	TOASCII

toascii:
	li	$t5, '0'
	addu	$a0, $a0, $t5		# v += '0';
	
	ble	$a0, '9', skip		# if( v > '9' ) 
	addiu	$a0, $a0, 7			# v += 7;  // 'A' - '9' - 1
	
skip:	
	jr	$ra