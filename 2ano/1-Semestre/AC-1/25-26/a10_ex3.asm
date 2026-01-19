	.data
	
	.eqv	SIZE, 10
	.eqv	exit, 10
	.align	3
arr:	.space	80	# 10 * 8
	
	.eqv	read_double, 7
	.eqv	print_double, 3
	
zero:	.double	0.0
	
	.text
	.globl main
main:	
	la	$t0, arr		# double arr[SIZE];
	li	$t1, 0		# i = 0
	
for0:	bge	$t1, SIZE, endf0	# for(i=0; i < SIZE; i++)
	li	$v0, read_double
	syscall
	sll	$t2, $t1, 3		# i * 8
	addu	$t2, $t2, $t0	# arr[i]
	s.d	$f0, 0($t2)		# arr[i] = read_double();
	addiu	$t1, $t1, 1		# i++
	j	for0
endf0:
	or	$a0, $0, $t0
	li	$a1, SIZE
	jal	average
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print_double( average(arr, SIZE) ); 
	
	la	$a0, arr
	li	$a1, SIZE
	jal	var
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print_double( var(arr, SIZE) );
	
	la	$a0, arr
	li	$a1, SIZE
	jal	stdev
	mov.d	$f12, $f0
	li	$v0, print_double
	syscall			# print_double( stdev(arr, SIZE) );
	
	li	$v0, exit
	syscall			# end

##	average
average:				# average($a0 = arr, $a1 = SIZE)
	or	$t0, $0, $a0	# arr
	sll	$t1, $a1, 3		# SIZE * 8
	addu	$t1, $t1, $t0	# arr[SIZE + 1]
	la	$t2, zero
	l.d	$f0, 0($t2)	
for1:	bge	$t0, $t1, endf1
	l.d	$f2, 0($t0)	
	add.d	$f0, $f0, $f2	# avr += avr
	addiu	$t0, $t0, 8		# arr++
	j	for1
endf1:	 
	li	$t2, SIZE
	mtc1	$t2, $f2
	cvt.d.w	$f2, $f2
	div.d	$f0, $f0, $f2	# avr /= SIZE
	jr	$ra


##	var
var:				# var($a0 = arr, $a1 = SIZE)
	addiu	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	s.s	$s1, 8($sp)
	s.s	$f22, 12($sp)
	sw	$f24, 16($sp)
	
	
	jal	average		# average(array, nval); 
	cvt.s.d	$f2, $f12		# media = (float)average(array, nval); 
	la	$t0, zero
	l.d	$f0, 0($t0)		# soma = 0.0
	li	$t0, 0		# i = 0
for2:	bge	$t0, $a1, endf2	# for(i=0, soma=0.0; i < nval; i++) 
	
	sll	$t1, $t0, 3
	addu	$t1, $
	
	addiu	$t0, $t0, 1		# i++	
	j	for2
endf2
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	l.s	$s1, 8($sp)
	l.s	$f22, 12($sp)
	lw	$f24, 16($sp)
	addiu	$sp, $sp, 20
	jr	$ra
	
## 	stdev
stdev:				# stdev($a0 = arr, $a1 = SIZE)
	
	
	jr	$ra





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