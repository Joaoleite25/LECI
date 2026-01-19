	.data
	
	.eqv	exit, 10
result:	.float	1.0
	
	.eqv	read_int, 5
	.eqv	read_float, 6
	.eqv	print_float, 2
	
	.text
	.globl main
main:	
	li	$v0, read_float
	syscall			# x
	
	li	$v0, read_int
	syscall			# y
	
	mov.s	$f12, $f0
	or	$a0, $v0, $0
	jal	xtoy		# float xtoy(float x, int y) 
	
	mov.s	$f12, $f0
	li	$v0, print_float
	syscall			# print(resultado)
	
	li	$v0, exit
	syscall			# end

## 	XTOY
xtoy:				# $f12 = x, $a0 = y
	addiu	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	s.s	$f20, 8($sp)
	s.s	$f22, 12($sp)
	sw	$s1, 16($sp)
	
	mov.s	$f22, $f12		# x
	or	$s1, $a0, $0	# y
	li	$s0, 0		# i=0
	la	$t1, result
	l.s	$f20, 0($t1)		# result=1.0
	
	jal	abs		# abs(y)
for:	
	bge	$t0, $v0, endf	# for(i=0, result=1.0; i < abs(y); i++) 
	
	ble	$s1, 0, else	# if(y > 0) 
	mul.s	$f20, $f20, $f0	# result *= x; 
	j	skip
	
else:	div.s	$f20, $f20, $f0	# result /= x; 
	
skip:	addiu	$t0, $t0, 1		# i++
	j	for
endf:	
	mov.s	$f0, $f20		# return result; 
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	l.s	$f20, 8($sp)
	l.s	$f22, 12($sp)
	lw	$s1, 16($sp)
	addiu	$sp, $sp, 20
	jr	$ra	

##	ABS
abs:				# $a0 = val
	bge	$a0, 0, end		# if(val < 0)
	sll	$t1, $a0, 2
	subu	$a0, $a0, $t1	# val = -val;
	
end:	jr	$ra