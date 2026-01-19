	.data
	.align 2
st_a:	.space 176 # 4 *44
str:	.asciiz "\nMedia: "
media:	.float
	.eqv Max_Students, 4
	
	.eqv print_s, 4
	.eqv print_f, 2
	
	.text
	.globl main
	
main:	
	addiu 	$sp, $sp, -8
	sw 	$ra, 0($sp)
	sw 	$s0, 4($sp)
	
	la	$a0, st_a
	li 	$a1, Max_Students
	jal	read_d			# read_data( st_array, MAX_STUDENTS );
	
	la	$a0, st_a
	li 	$a1, Max_Students
	la	$a2, media
	jal	max			
	move 	$s0, $v0		# pmax = max( st_array, MAX_STUDENTS, &media );
	
	li	$v0, print_s
	la	$a0, str
	syscall
	
	li	$v0, print_f
	la	$t0, media
	l.s	$f12, 0($t0)		# ler o valor da media pra f12
	syscall				# print_float( media );
	
	move	$a0, $s0
	jal	print_student
	
	lw 	$ra, 0($sp)
	lw 	$s0, 4($sp)
	addiu 	$sp, $sp, 8
	
	li 	$v0, 0
	
	jr	$ra
	
read_d:	
	
	
	
	jr 	$ra
	
	
max:	
	jr 	$ra
	
print_student:
	jr 	$ra