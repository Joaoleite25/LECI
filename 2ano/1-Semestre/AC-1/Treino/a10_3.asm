	.data
xn:	.double	1.0
zero:	.double	0.0
zf:	.float	0.0
d1:	.double	0.5
arr:	.space	80	# SIZE * 8
espaco:	.asciiz	"\n"
result:	.float	1.0
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv	SIZE, 10
	
	.text
	.globl main
main:	
	addiu	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	
	li	$t0, 0		# i = 0
	
	la	$s0, arr
	move	$t0, $s0
	
for:	
	bge	$t0, SIZE, endf	# i < SIZE
	
	l.d	$f2, 0($s0)		# arr[i]
	
	li 	$v0, read_double
	syscall			# read_double()
	
	s.d	$f0, 0($s0)		# arr[i] = read_double(); 
	
	addiu	$t0, $t0, 1		# i++
	
	addiu	$s0, $s0, 8		# arr++
	 
	j	for
	
endf:
	#move	$a0, $t1
	#li	$a1, SIZE	
	#jal	average		# average(arr, SIZE)
	#mov.d 	$f12, $f0
	#li 	$v0, print_double	
	#syscall			# print_double()
	#la	$a0, espaco
	#li	$v0, 4
	#syscall			# \n
	
	move	$a0, $t1
	li	$a1, SIZE	
	jal	var		# var(arr, SIZE)
	mov.d 	$f12, $f0
	li 	$v0, print_double	
	syscall			# print_double()
	la	$a0, espaco
	li	$v0, 4
	syscall			# \n
	
	move	$a0, $t1
	li	$a1, SIZE	
	jal	stdev		# stdev(arr, SIZE)
	mov.d 	$f12, $f0
	li 	$v0, print_double	
	syscall			# print_double()
	la	$a0, espaco
	li	$v0, 4
	syscall			# \n
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addiu	$sp, $sp, 8
	
	jr	$ra

#################################

var:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la	$t0, zf
	l.s	$f2, 0($t0)		# soma = 0.0
	
	li	$t0, 1		# i = 0
	
	move	$a0, $a0
	move	$a1, $a1	
	jal	average		# average(array, nval)
	mov.s	$f4, $f0		# media = (float)average(array, nval); 
	
var_for:	
	bge	$t0, $a1, var_endf	# i < nval
	
	l.s	$f8, 0($a0)		# array[i]
	sub.s	$f6, $f8, $f4	# array[i] - media
	mov.s	$f12, $f6
	li	$a0, 2
	jal	xtoy		# xtoy((float)array[i] - media, 2)
	add.s	$f2, $f2, $f0
	
	addiu	$t0, $t0, 1		# i++
	
	j	var_for

var_endf:	
	cvt.d.s	$f2, $f2		# (double)soma
	mtc1	$a1, $f10
	cvt.d.w	$f10, $f10		# (double)nval
	
	div.d	$f0, $f2, $f10	# return (double)soma / (double)nval; 
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra
	
#################################

stdev:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	
	jr	$ra

#################################


sqrt:	
	la	$t1, zero
	l.d	$f2, 0($t1)		# 0.0;
	
	la	$t2, xn
	l.d	$f4, 0($t2)		# xn = 1.0;
	
	la	$t3, d1
	l.d	$f10, 0($t3)	# 0.5;
	
	li	$t0, 0		# int i = 0;
	
	c.le.d	$f12, $f2
	bc1t	sqrt_else		# if(val > 0.0)
	
sqrt_do:	
	mov.d	$f6, $f4		# aux = xn;
	
	div.d	$f8, $f12, $f4	# val/xn
	add.d	$f8, $f4, $f8	# xn + val/xn
	mul.d	$f4, $f10, $f8	# xn = 0.5 * (xn + val/xn); 
	
	c.eq.d	$f6, $f4
	bc1t	sqrt_ignore		# aux != xn
	
	addi	$t0, $t0, 1		# i++
	bge	$t0, 25, sqrt_ignore	# ++i < 25
	
	j	sqrt_do

sqrt_else:	
	mov.d	$f4, $f2		# xn = 0.0; 

sqrt_ignore:
	
	mov.d	$f0, $f4		# return xn; 
	
	jr	$ra
	
##################################

average:
	addiu	$t0, $a1, -1	# int i = n-1; 
	
	la	$t1, zero
	l.d	$f2, 0($t1)		# double zero = 0.0; 

average_for:
	blt	$t0, 0, average_end	# for(; i >= 0; i--)
	
	mul	$t2, $t0, 8		# i * 8
	
	addu	$t2, $t2, $a0	
	l.d	$f4, 0($t2)		# array[i*8]
	
	add.d	$f2, $f2, $f4	# sum += array[i*8];
	
	addiu	$t0, $t0, -1	# i--
	
	j	average_for

average_end:
	mtc1	$a1, $f6
	cvt.d.w	$f6, $f6		# converter n em double
	
	div.d	$f0, $f2, $f6	# return sum / (double)n; 
	
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