	# Mapa de registos
	# num: $t0
	# p: $t1
	# *p: $t2
	.data
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1
str:	.space 21
	
	.text
	.globl main
main:	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall				# lê a string
	
	li $t0, 0			# num = 0
	la $t1, str			# p = str
	
while:	lb $t2, 0($t1)			# *p = str[i]
	beq $t2, '\0', endw
	
if:	blt $t2, '0', endif		# if str[i] >= '0'
	bgt $t2, '9', endif		# if str[i] <= '9'
	addi $t0, $t0, 1		# num ++ 
	
endif:	addiu $t1, $t1, 1		# p ++
	j while

endw:	li $v0, print_int10		
	or $a0, $0, $t0
	syscall				# print (num)
	
	jr $ra