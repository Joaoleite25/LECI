	.data
	
	.align	2
student0:	.space	4		# 0 + 4 = 4
	.space	36		# 4 + 36 = 40
	.space	8		# 40 + 8 = 48
	.space	4		# 48 + 4 = 52
	.align	3
student1:	.space	4		# 0 + 4 = 4
	.space	36		# 4 + 36 = 40
	.space	8		# 40 + 8 = 48
	.space	4		# 48 + 4 = 52
	.align	3
student2:	.space	4		# 0 + 4 = 4
	.space	36		# 4 + 36 = 40
	.space	8		# 40 + 8 = 48
	.space	4		# 48 + 4 = 52
	.align	3
student3:	.space	4		# 0 + 4 = 4
	.space	36		# 4 + 36 = 40
	.space	8		# 40 + 8 = 48
	.space	4		# 48 + 4 = 52
	.align	3
student4:	.space	4		# 0 + 4 = 4
	.space	36		# 4 + 36 = 40
	.space	8		# 40 + 8 = 48
	.space	4		# 48 + 4 = 52
	
	.eqv	exit, 10
	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	print_float, 2
	
str0:	.asciiz	"Ana Silva"
str1:	.asciiz	"Bruno Costa"
str2:	.asciiz	"Carla Sousa"
str3:	.asciiz	"Diogo Ramos"
str4:	.asciiz	"Eva Martins"
	
db0:	.double	15.3
db1:	.double	13.7
db2:	.double	16.8
db3:	.double 	14.5
db4:	.double	17.2	

frase0:	.asciiz	"Números de aluno do curso "
frase1:	.asciiz	"Média do curso "
doisp:	.asciiz	": "
fechar:	.asciiz	"\n"

zero:	.double	0.0
	
	.text
	.globl main
	# Mapa de Registos:
	# $s0 = c
	# 
	# 
	# 
main:	
	jal	insercao
	
	addiu	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	
	li	$s0, 1
	
	
fmain0:	bgt	$s0, 3, endfm0		# c <= 3
	la	$a0, frase0
	li	$v0, print_string
	syscall
	or	$a0, $s0, $0
	li	$v0, print_int10
	syscall
	la	$a0, doisp
	li	$v0, print_string
	syscall
	or	$a0, $s0, $0
	jal	gtbc			# getTotalByCourse(students, 5, c)
	or	$a0, $a0, $0
	li	$v0, print_int10
	syscall
	la	$a0, fechar
	li	$v0, print_string
	syscall
	
	addiu	$s0, $s0, 1			# c++
	
	j	fmain0
endfm0:	
	li	$s0, 1
fmain1:	bgt	$s0, 3, endfm1		# c <= 3
	la	$a0, frase1
	li	$v0, print_string
	syscall
	or	$a0, $s0, $0
	li	$v0, print_int10
	syscall
	la	$a0, doisp
	li	$v0, print_string
	syscall
	or	$a0, $s0, $0
	jal	gca			# getCourseAverage(students, 5, c)
	mov.s	$f12, $f0
	li	$v0, print_float
	syscall
	la	$a0, fechar
	li	$v0, print_string
	syscall
	
	addiu	$s0, $s0, 1			# c++
	
	j	fmain1
endfm1:	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addiu	$sp, $sp, 8
	
	li	$v0, exit
	syscall				# return 0


#	getTotalByCourse(students, 5, c)
	# Mapa de registos
	# $t0 = count
	# $t1 = ponteiro
	# $t2 = i
	# $t3 = student->course
gtbc:	
	li	$t0, 0
	la	$t1, student0
	li	$t2, 0
forb:	bge	$t2, 5, endfb	# i < TotalStudents
	lw	$t3, 48($t1)
	bne	$t3, $a0, skipb	# student->course == courseId
	addiu	$t0, $t0, 1		# count++
skipb:	addiu	$t2, $t2, 1		# i++
	addiu	$t1, $t1, 56	# ponteiro = proxStudent
	j	forb
endfb:		
	or	$a0, $t0, $0	# return count
	
	jr	$ra

#	getCourseAverage(students, 5, c)
	# Mapa de Registos:
	# $t0 = count
	# $f0 = sum
	# $t1 = i
	# $t2 = ponteiro
gca:	
	la	$t0, zero
	l.d	$f0, 0($t0)
	li	$t0, 0
	li	$t1, 0
	la	$t2, student0
forg:	bge	$t1, 5, endfg	# i < TotalStudents
	lw	$t3, 48($t2)
	bne	$t3, $a0, skipg	# student->course == courseId	
	l.d	$f2, 40($t2)
	add.d	$f0, $f0, $f2	# sum += Student->avg
	addiu	$t0, $t0,1		# count++
skipg:	addiu	$t1, $t1, 1		# i++
	addiu	$t2, $t2, 56	# ponteiro = proxStudent
	j	forg
endfg:
	mtc1	$t0, $f2
	cvt.d.w	$f2, $f2
	div.d	$f0, $f0, $f2
	cvt.s.d	$f0, $f0
	jr	$ra


#	Insercao
	# Mapa de Registos:
	# $t0 = ponteiro
	# $t1 = &student
insercao:	
	la	$t0, student0
	li	$t1, 101
	sw	$t1, 0($t0)
	la	$t1, str0
	sw	$t1, 4($t0)
	la	$t1, db0
	l.d	$f0, 0($t1)
	s.d	$f0, 40($t0)
	li	$t1, 1			# course 1
	sw	$t1, 48($t0)		# aluno 1
	
	la	$t0, student1
	li	$t1, 102
	sw	$t1, 0($t0)
	la	$t1, str1
	sw	$t1, 4($t0)
	la	$t1, db1
	l.d	$f0, 0($t1)
	s.d	$f0, 40($t0)
	li	$t1, 2			# course 2
	sw	$t1, 48($t0)		# aluno 2
	
	la	$t0, student2
	li	$t1, 103
	sw	$t1, 0($t0)
	la	$t1, str2
	sw	$t1, 4($t0)
	la	$t1, db2
	l.d	$f0, 0($t1)
	s.d	$f0, 40($t0)
	li	$t1, 3			# course 3
	sw	$t1, 48($t0)		# aluno 3
	
	la	$t0, student3
	li	$t1, 104
	sw	$t1, 0($t0)
	la	$t1, str3
	sw	$t1, 4($t0)
	la	$t1, db3
	l.d	$f0, 0($t1)
	s.d	$f0, 40($t0)
	li	$t1, 1			# course 1
	sw	$t1, 48($t0)		# aluno 4
	
	la	$t0, student4
	li	$t1, 105
	sw	$t1, 0($t0)
	la	$t1, str4
	sw	$t1, 4($t0)
	la	$t1, db4
	l.d	$f0, 0($t1)
	s.d	$f0, 40($t0)
	li	$t1, 2			# course 2
	sw	$t1, 48($t0)		# aluno 2
	
	jr	$ra
