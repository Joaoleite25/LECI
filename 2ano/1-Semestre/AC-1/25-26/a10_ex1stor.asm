	.data
	
	.eqv	exit, 10
result:	.float	1.0
	
	.eqv	read_int, 5
	.eqv	read_float, 6
	.eqv	print_float, 2
	
	.text
x2y:	addiu	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	s.s	$f20, 8($sp)
	s.s	$f22, 12($sp)
	sw	$s1, 16($sp)
	
	li	$s0, 0
	la	$t0, result
	l.s	$f20, 0($t0)
	move	$s1, $a0
	mov.s	$f22, $f12
	
forx2y:	move	$a0, $s1
	jal	abs
	bge	$s0, $v0, endfx2y
if:	blez	$s1, else
	mul.s	$f20, $f20, $f22
	j	endif
	
else:	div.s	$f20, $f20, $f22
endif:	addi	$s0, $s0, 1
	j	forx2y

endfx2y:	mov.s	$f0, $f20
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	l.s	$f20, 8($sp)
	l.s	$f22, 12($sp)
	lw	$s1, 16($sp)
	addiu	$sp, $sp, 20
	jr	$ra
	
abs:	bgtz	$a0, end
	sub	$a0, $0, $a0
end:	move	$v0, $a0
	jr	$ra	