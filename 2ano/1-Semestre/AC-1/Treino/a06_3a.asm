	.data
array:	.word str1, str2, str3
str1:	.asciiz "Array" 
str2:	.asciiz "de" 
str3:	.asciiz "ponteiros"
str4:	.asciiz "\nString #"
str5:	.asciiz ": "
str6:	.asciiz "-"

	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	.eqv SIZE, 3
	
	.text
	.globl main
main:	
	li $t0, 0
	li $t1, SIZE
	
for:	
	bge $t0, $t1, endfor
	
	la $a0, str4
	li $v0, print_string
	syscall
	
	move $a0, $t0
	li $v0, print_int10
	syscall
	
	
	la $a0, str5
	li $v0, print_string
	syscall
	
	# ponteiro de array[i]
	la $t2, array
	sll $t3, $t0, 2
	addu $t2, $t2, $t3
	
	lw $t4, 0($t2)
	
	li $t5, 0
	
while:	
	add $t6, $t4, $t5
	lb $t7, 0($t6)
	beq $t7, '\0', endw
	
	move $a0, $t7
	li $v0, print_char
	syscall
	
	la $a0, str6
	li $v0, print_string
	syscall
	
	addi $t5, $t5, 1
	
	j while
	
endw:	
	addi $t0, $t0, 1
	j for

endfor:
	jr $ra