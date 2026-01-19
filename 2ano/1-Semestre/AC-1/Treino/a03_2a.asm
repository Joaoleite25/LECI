	# Mapa de registos:
	# value: $t0
	# bit: $t1
	# i: $t2 
	# 0x80000000 : $t3
	# r = $t4
	
	.data
str1:	.asciiz "Introduza um numero: "
str2: 	.asciiz "\nO valor em binário e: "

	.eqv print_string, 4
	.eqv read_int, 5
	#.eqv print_int10, 1
	.eqv print_char, 11
	
	.text
	.globl main
main:	li $t2, 0				# i = 0

	la $a0, str1
	li $v0, print_string
	syscall					# print str1
	
	li $v0, read_int
	syscall					# lê num
	
	or $t0, $0, $v0
	
	la $a0, str2
	li $v0, print_string
	syscall
	
for:	bge $t2, 32, enfor

	li $t3, 0x80000000	
	and $t1, $t0, $t3			# isolar bit
	
	rem $t4, $t2, 4
	
if1:	bne $t4, 0, endif1
	
	li $v0, print_char
	li $a0, ' '
	syscall					# print '1'
	
	li $t4, 0

endif1:	j if

if:	beq $t1, 0, else			# se for igual vai pro else
	
	li $v0, print_char
	li $a0, '1'
	syscall					# print '1'
	
	j endif

else:	ori $v0, $0, print_char
	li $a0, '0'
	syscall					# print '0'
	
	j endif

endif:	addi $t2, $t2, 1
	sll $t0, $t0, 1
	
	j for
	
enfor:	jr $ra