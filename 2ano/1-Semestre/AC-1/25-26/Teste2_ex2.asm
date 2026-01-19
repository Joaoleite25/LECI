	.data
	
oldg:	.float	-1.0
g:	.float	1.0
s:	.float	0.0
	
	.text
	.globl func2
###	func2
	# Mapa de Registos:
	# $f0 = oldg
	# $f2 = g
	# $f4 = s
	# $t0 = k
func2:			# $a0 = *a, $a1 = n, $f12 = t
	la	$t0, oldg
	l.s	$f0, 0($t0)	# oldg = -1.0
	la	$t0, g
	l.s	$f2, 0($t0)	# g = 1.0
	la	$t0, s
	l.s	$f4, 0($t0)	# s = 0.0
	li	$t0, 0	# k = 0
for:	
	bge	$t0, $a1, endf	# k < n
	sll	$t1, $t0, 3		# k * 8
	addu	$t1, $t1, $a0	# *a[k]
	l.s	$f6, 0($t1)		# &a[k]
	
while:	sub.s	$f6, $f2, $f0	# g - oldg
	c.le.s	$f6, $f12
	bc1f	endw		# (g - oldg) > t
	
	mov.s	$f0, $f2		# oldg = g
	
	add.s	$f2, $f2, $f6	# g + a[k]
	div.s	$f2, $f2, $f12	# g = (g + a[k]) / t
	
	j	while
endw:	
	add.s	$f4, $f4, $f2	# s += g
	s.s	$f2, 0($t1)		# a[k] = g
	
	addiu	$t0, $t0, 1		# k++
	j	for
endf:
	mtc1	$a1, $f6
	cvt.s.w	$f6, $f6		# (float) n
	div.s	$f12, $f4, $f6	# return s / (float) n
	
	jr	$ra
