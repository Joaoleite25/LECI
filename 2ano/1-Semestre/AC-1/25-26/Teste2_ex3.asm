	.data
	
	.align	3
t_kvd:	.space	40

zero:	.double	0.0
	
	.text
	.globl func3
###	func3
	# Mapa de Registos:
	# $f0 = sum
	# $t0 = i
	# $t1 = j
	# 
func3:			# $a0 = nv, $a1 = *pt
	la	$t0, zero
	l.d	$f0, 0($t0)		# sum = 0.0
	li	$t0, 0		# i = 0
	
for:	bge	$t0, $a0, endf
	
	li	$t1, 0		# j = 0
do:	
	addu	$t2, $t1, $a1	# *pt->quest[j]
	lb	$t2, 16($t2)	# pt->quest[j]
	mtc1	$t2, $f2
	cvt.d.w	$f2, $f2		# (double) pt->quest[j]
	add.d	$f0, $f0, $f2	# sum += (double) pt->quest[j]
	addiu	$t1, $t1, 1		# j++
	
	lbu	$t2, 4($a1)		# pt->nm
	blt	$t1, $t2, do	# while (j < pt->nm)
	
	l.d	$f2, 8($a1)		# pt->grade
	div.d	$f2, $f0, $f2	# sum / pt->grade
	cvt.w.d	$f2, $f2		# (int) (sum / pt->grade)
	mfc1	$t2, $f2
	sw	$t2, 0($a1)		# pt->acc = (int) (sum / pt->grade)
	
	addiu	$a1, $a1, 40	# pt++
	addiu	$t0, $t0, 1		# i++
	j	for
endf:	
	lw	$t2, 32($a1)	# pt->cq
	mtc1	$t2, $f2
	cvt.d.w	$f2, $f2		# (double) pt->cq
	l.d	$f4, 8($a1)		# pt->grade
	mul.d	$f0, $f4, $f2	# return (pt->grade * (double) pt->cq) 
	
	jr	$ra


# Typedef struct {		Align	Size	Offset
# 	int acc		2	4	0
#	unsigned char nm	1	1	4
# 	double grade	3	8	5-->8
# 	char quest[14]	1	14	16
# 	int cq		2	4	30-->32
# } t_kvd					36-->40
