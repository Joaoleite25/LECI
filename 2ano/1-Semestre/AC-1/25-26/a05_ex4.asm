	.data
	
	.eqv	SIZE, 10
	.eqv	TRUE, 1
	.eqv	FALSE, 0
	
	.eqv	read_int, 5
	.eqv	print_int10, 1
	
	.align 	2
lista:	.space	40		# 10 * 4
	
	.text
	.globl main
main:	
	la	$t0, lista		# lista
	li	$t1, SIZE
	mulu	$t1, $t1, 4
	addu	$t1, $t0, $t1	# lista + SIZE

for:	
	bge	$t0, $t1, endfor	# for (p < lista + SIZE)
	
	li	$v0, read_int
	syscall			# read_int()
	
	sw	$v0, 0($t0)		# *p = read_int();
	
	addiu	$t0, $t0, 4		# p++
	
	j	for
endfor:	
	la	$t0, lista		# lista
	li	$t1, SIZE
	addiu	$t1, $t1, -1
	mulu	$t1, $t1, 4
	addu	$t1, $t0, $t1	# pUltimo = lista + (SIZE - 1)

do:	
	la	$t0, lista		# lista
	li	$t2, FALSE		# houveTroca = FALSE; 

f:	
	bge	$t0, $t1, endf	# for (p = lista; p < pUltimo; p++) 
	
if:	lw	$t3, 0($t0)		# *p
	lw	$t4, 4($t0)		# *(p + 1)
	ble	$t3, $t4, skip	# if (*p > *(p+1)) 
	
	sw	$t4, 0($t0)		# *p = *(p + 1); 
	sw	$t3, 4($t0)		# *(p + 1) = *p; 
	
	li	$t2, TRUE		# houveTroca = TRUE; 
	
skip:	
	addiu	$t0, $t0, 4		# p++
	j	f
	
endf:	
	beq	$t2, TRUE, do	# while (houveTroca==TRUE); 
	
	la	$t0, lista		# lista
	addiu	$t1, $t1, 4
	
f2:	
	bge	$t0, $t1, endf2	# for (p < lista + SIZE)
	
	lw	$a0, 0($t0)
	li	$v0, print_int10
	syscall			# print_int10(*p)
	
	addiu	$t0, $t0, 4		# p++
	
	j	f2

endf2:	
	
	jr	$ra
	
# Mapa de Registos
# $t0 = p = lista
# $t1 = lista + SIZE, $t1 = lista + (SIZE - 1)
# $t2 = houveTroca
# $t3 = *p
# $t4 = *(p + 1)
# 
# 
