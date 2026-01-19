	.data
result:	.float 1.0
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	#---
	
	# x = read_float();
	li	$v0, 6
	syscall
	
	# print_char('\n');
	li	$a0, '\n'
	li	$v0, 11
	syscall
	
	# n = read_int();
	li	$v0, 5
	syscall
	
	# print_float(xtoy(x,n))
	mov.s	$f12, $f0
	move	$a0, $v0
	jal	xtoy
	mov.s	$f12, $f0
	li	$v0, 2
	syscall
	
	#---
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
############
# $a0 -> $s1: 	int y
# $f12 -> $f20: 	float x
# $f22:  result
# $s0:	i
xtoy:	
	addiu $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)	# i 
	sw $s1, 8($sp)	# y
	s.s $f20,12($sp) 	# x
	s.s $f22, 16($sp)	# result
		
	li $s0, 0	# i = 0
	
	la $t1, result 
	l.s $f22, 0($t1)	# result
	
	mov.s $f20, $f12	# x
	
	move $s1, $a0	# y
	
	move $a0, $s1
	jal abs
	#$v0 = abs(y)
	
for_xtoy:
	bge $s0, $v0, end_for_xtoy	# i < abs(y)
	
if_xtoy: ble $s1, 0, else_xtoy	# y > 0

	# result *= x; result = result * x
	mul.s $f22, $f22, $f20
	j end_if_xtoy
else_xtoy:

	# result /= x; result = result / x
	div.s $f22, $f22, $f20

end_if_xtoy:
	
	addiu $s0, $s0, 1# i ++

	j for_xtoy
end_for_xtoy:
	
	mov.s $f0, $f22	# return result
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)	# i 
	lw $s1, 8($sp)	# y
	l.s $f20,12($sp) 	# result
	l.s $f22, 16($sp)	# x
	addiu $sp, $sp, 20
	
	jr $ra
	
###########
# $a0 : val

abs: 	

if_abs:	bge $a0, 0, end_if_abs	# (val < 0

	sub $a0, $0, $a0		# val = -val; 
end_if_abs:
	
	move $v0, $a0

	jr $ra
