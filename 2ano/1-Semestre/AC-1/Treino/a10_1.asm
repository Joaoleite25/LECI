	.data
result:	.float	1.0
	
	.eqv 	print_f, 2
	
	.text
	.globl main

main:
	addiu 	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	li 	$v0, 6
	syscall			# read_float(x)
	
	li	$v0, 5
	syscall			# read(y)
	
	mov.s	$f12, $f0
	move	$a0, $v0
	jal	xtoy
	
	mov.s	$f12, $f0
	li	$v0, 2
	syscall			# print_float( result );
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	jr	$ra
	
######################

xtoy:	
	addiu 	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	mov.s	$f4, $f12		# x
	
	move	$t3, $a0		# y	
	
	li	$t0, 0		# i = 0
	la	$t1, result
	l.s	$f2, 0($t1)		# result
	
	move	$a0, $t3
	jal 	abs

xtoy_for:
	bge	$t0, $v0, stoy_endf	# i < abs(y)
	
xtoy_if:	
	ble	$t3, 0, xtoy_else	# if(y > 0)
	
	mul.s	$f2, $f2, $f4	# result *= x; 
	
	j	xtoy_end
	
xtoy_else:	
	div.s	$f2, $f2, $f4	# result /= x; 
	
xtoy_end:
	addiu	$t0, $t0, 1		# i++
	
	j	xtoy_for

stoy_endf:
	mov.s	$f0, $f2		# return result; 
	
	lw	$ra, 0($sp)
	addiu 	$sp, $sp, 4
	
	jr	$ra

#######################

abs:		
	bge	$a0, 0, abs_end	# if(val < 0) 
	sub	$a0, $0, $a0	# val = -val; 

abs_end:	
	move	$v0, $a0		# return val; 
	
	jr	$ra