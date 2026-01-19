	.data
	
student:	.word	72343			# 72343

	.asciiz 	"Napoleao"			
	.space	9			# 8 + 1 + 9 = 18
	
	.asciiz 	"Bonaparte"			
	.space	5			# 9 + 1 + 5 = 15
	
	.float	5.1			# 5.1
	
mec:	.asciiz	"\nN. Mec: "
nome:	.asciiz	"\nN. Nome: "
v:	.asciiz	", "
nota:	.asciiz	"\nN. Nota: "

	.eqv 	print_i, 1
	.eqv	print_f, 2
	.eqv	print_s, 4
	
	.text
	.globl main
main:	
	la	$t1, student		# stg
	
	lw	$t2, 0($t1)		# stg.id_number
	la	$a0, mec
	li	$v0, print_s
	syscall				# print_string("\nN. Mec: "); 
	move	$a0, $t2
	li	$v0, print_i
	syscall				# print_intu10(stg.id_number);
	
	addiu	$t1, $t1, 22	# stg 4 + 18 =  stg.last_name
	la	$a0, nome
	li	$v0, print_s
	syscall				# print_string("\nN. Nome: "); 
	move	$a0, $t1
	li	$v0, print_s
	syscall				# print_string(stg.last_name);
	addiu	$t1, $t1, -18			# stg - 18 = stg.first_name
	la	$a0, v
	li	$v0, print_s
	syscall				# print_char(','); 
	move	$a0, $t1
	li	$v0, print_s
	syscall				# print_string(stg.first_name); 
	addiu	$t1, $t1, 36			# stg + 18 + 15 = 33 -> 36
	
	l.s	$f2, 0($t1)		# stg.grade
	la	$a0, nota
	li	$v0, print_s
	syscall				# print_string("\nN. Nota: "); 
	mov.s	$f12, $f2
	li	$v0, print_f
	syscall				# print_float(stg.grade);
	
	jr	$ra