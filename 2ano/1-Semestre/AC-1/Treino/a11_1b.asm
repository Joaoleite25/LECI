	.data
	
student:	.space	44		# 4 + 18 + 18(15 + 3) + 4 = 44 
	
mec:	.asciiz	"\nN. Mec: "
nome:	.asciiz	"\nNome: "
nome1:	.asciiz	"\nPrimeiro Nome: "
nome2:	.asciiz	"\nUltimo Nome: "
v:	.asciiz	", "
nota:	.asciiz	"\nNota: "

	.eqv 	print_i, 1
	.eqv	print_f, 2
	.eqv	print_s, 4
	
	.eqv 	read_i, 5
	.eqv	read_f, 6
	.eqv	read_s, 8
	
	.text
	.globl main
main:	
	# Read
	la	$t1, student		# stg
	
	la	$a0, mec
	li	$v0, print_s
	syscall				# print_string("\nN. Mec: "); 
	li	$v0, read_i
	syscall				# read_intu10(stg.id_number);
	sw	$v0, 0($t1)		# stg.id_number
	
	addiu	$t1, $t1, 4		# stg + 4 =  stg.first_name
	
	la	$a0, nome1
	li	$v0, print_s
	syscall				# print_string("\nN. Primeiro Nome: ");
	move	$a0, $t1		# endereço
	li	$a1, 17		# limite
	li	$v0, read_s
	syscall				# read_string(stg.first_name);
	
	addiu	$t1, $t1, 18	# stg + 18 = stg.last_name
	
	la	$a0, nome2
	li	$v0, print_s
	syscall				# print_string("\nN. Ultimo Nome: ");
	move	$a0, $t1		# endereço
	li	$a1, 14		# limite
	li	$v0, read_s
	syscall				# read_string(stg.last_name); 
	
	addiu	$t1, $t1, 18	# stg + 15 = 15 -> 18 = stg.grade
	
	la	$a0, nota
	li	$v0, print_s
	syscall				# print_string("\nN. Nota: ");
	li	$v0, read_f
	syscall				# read_float(stg.grade);
	s.s	$f0, 0($t1)		# stg.grade
	
	
	# Print
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