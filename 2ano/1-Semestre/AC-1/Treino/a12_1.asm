	.data
	.eqv	MAX_STUDENTS, 4
student:	.space	176		# (4 + 18 + 18(15) + 4) * 4
	
mec:	.asciiz	"\nN. Mec: "
nome:	.asciiz	"\nNome: "
nome1:	.asciiz	"\nPrimeiro Nome: "
nome2:	.asciiz	"\nUltimo Nome: "
v:	.asciiz	", "
nota:	.asciiz	"\nNota: "
zero:	.float	0.0
maxi:	.float	-20.0
media:	.asciiz	"\nMedia: "
	
	.eqv 	print_i, 1
	.eqv	print_f, 2
	.eqv	print_s, 4
	
	.eqv 	read_i, 5
	.eqv	read_f, 6
	.eqv	read_s, 8
	
	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la	$a0, student
	li	$a1, MAX_STUDENTS
	jal	read_data			# read_data( st_array, MAX_STUDENTS ); 
	
	la	$t1, zero
	l.s	$f2, 0($t1)		# float zero = 0.0; 
	la	$a0, student
	li	$a1, MAX_STUDENTS
	mov.s	$f12, $f2
	jal	max			# pmax = max( st_array, MAX_STUDENTS, &media ); 
	move	$t1, $v0			# pmax
	
	la	$a0, media
	li	$v0, print_s
	syscall				# print_string("\nMedia: ");
	mov.s	$f12, $f0			# media
	li	$v0, print_f
	syscall				# print_float( media ); 
	
	move	$a0, $t1
	jal	print_student
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
	
####################################

read_data:
	li 	$t1, 0			# i = 0
	move	$t2, $a0			# stg
	move	$t3, $a1			# ns
	
read_data_for:
	bge	$t1, $t3, read_data_end		# i < ns
	
	move	$t0, $t2			# stg
	mul	$t4, $t1, 44		# i *44
	addu	$t0, $t0, $t4		# i + student
	
	# Read
	la	$a0, mec
	li	$v0, print_s
	syscall				# print_string("\nN. Mec: "); 
	li	$v0, read_i
	syscall				# read_intu10(stg.id_number);
	sw	$v0, 0($t0)		# stg.id_number
	
	addiu	$t0, $t0, 4		# stg + 4 =  stg.first_name
	
	la	$a0, nome1
	li	$v0, print_s
	syscall				# print_string("\nN. Primeiro Nome: ");
	move	$a0, $t0		# endereço
	li	$a1, 17		# limite
	li	$v0, read_s
	syscall				# read_string(stg.first_name);
	
	addiu	$t0, $t0, 18	# stg + 18 = stg.last_name
	
	la	$a0, nome2
	li	$v0, print_s
	syscall				# print_string("\nN. Ultimo Nome: ");
	move	$a0, $t0		# endereço
	li	$a1, 14		# limite
	li	$v0, read_s
	syscall				# read_string(stg.last_name); 
	
	addiu	$t0, $t0, 18	# stg + 15 = 15 -> 18 = stg.grade
	
	la	$a0, nota
	li	$v0, print_s
	syscall				# print_string("\nN. Nota: ");
	li	$v0, read_f
	syscall				# read_float(stg.grade);
	s.s	$f0, 0($t0)		# stg.grade
	
	addiu	$t1, $t1, 1
	
	j	read_data_for
	
read_data_end:	
	jr	$ra
	
###################################

max:
	li 	$t1, 0			# i = 0
	move	$t2, $a0			# stg
	move	$t3, $a1			# ns
	
	li	$t5, 0			# p = 0
	
	la	$t4, maxi
	l.s	$f4, 0($t4) 		# max
	la	$t4, zero
	l.s	$f6, 0($t4) 		# sum
	
max_for:
	bge	$t1, $t3, max_end		# i < ns
	
	move	$t0, $t2			# stg
	mul	$t4, $t1, 44		# i *44
	addu	$t0, $t0, $t4		# i + student
	
	move	$t6, $t0			# pmax
	addiu	$t0, $t0, 40	# stg + 4 + 18 + 15 = 15 -> 18 = stg.grade
	l.s	$f2, 0($t0)
	
	add.s	$f6, $f6, $f2	# sum += p->grade; 
	
	c.le.s	$f2, $f4
	bc1t	max_ignore		# if(p->grade > max_grade) 
	
	mov.s	$f4, $f2		# max_grade = p->grade; 
	move	$t5, $t6		# pmax = p; 
	
max_ignore:
	addiu	$t1, $t1, 1
	
	j	max_for
	
max_end:	
	mtc1	$t3, $f8
	cvt.s.w	$f8, $f8		# (float)ns
	div.s	$f0, $f6, $f8	# *media = sum / (float)ns; 
	move	$v0, $t5		# return pmax; 

	jr	$ra

###################################

print_student:	
	move	$t0, $a0		# *p
	
	la	$a0, mec
	li	$v0, print_s
	syscall				# print_string("\nN. Mec: "); 
	lw	$t1, 0($t0)		# stg.id_number
	move	$a0, $t1
	li	$v0, print_i
	syscall				# print_intu10(stg.id_number);
	
	addiu	$t0, $t0, 4		# stg + 4 =  stg.first_name
	
	la	$a0, nome1
	li	$v0, print_s
	syscall				# print_string("\nN. Primeiro Nome: ");
	move	$a0, $t0		# endereço
	li	$v0, print_s
	syscall				# print_string(stg.first_name);
	
	addiu	$t0, $t0, 18	# stg + 18 = stg.last_name
	
	la	$a0, nome2
	li	$v0, print_s
	syscall				# print_string("\nN. Ultimo Nome: ");
	move	$a0, $t0		# endereço
	li	$v0, print_s
	syscall				# print_string(stg.last_name); 
	
	addiu	$t0, $t0, 18	# stg + 15 = 15 -> 18 = stg.grade
	
	la	$a0, nota
	li	$v0, print_s
	syscall				# print_string("\nN. Nota: ");
	l.s	$f12, 0($t0)
	li	$v0, print_f
	syscall				# print_float(stg.grade);
	
	jr	$ra