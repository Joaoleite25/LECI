	.data
str:	.asciiz "O meu pau"
	.eqv printint, 1
	.eqv read, 8
	.eqv SIZE, 20
str2:	.space 21
	
	.text
	.globl main
	
main:	
	li $t0, 0
	
	la $t2, str			# Definir a string

while:	
	lb $t1, 0($t2)			# Ponteiro

	beq $t1, '\0', endw
	
	addi $t2, $t2, 1		# Andar com o ponteiro
	addiu $t0, $t0, 1		# c ++
	
	j while

endw:	
	
	li $v0, printint
	move $a0, $t0
	syscall				# print
	
	
	
	la $a0, str2
	li $a1, SIZE
	li $v0, read
	syscall
	la $t2, str2
	
	li $t0, 0
	
w2:	
	lb $t1, 0($t2)			# Ponteiro

	beq $t1, '\0', end2
	
	addi $t2, $t2, 1		# Andar com o ponteiro
	addiu $t0, $t0, 1		# c ++
	
	j w2
	
end2:
	li $v0, printint
	move $a0, $t0
	syscall				# print
	
	jr $ra