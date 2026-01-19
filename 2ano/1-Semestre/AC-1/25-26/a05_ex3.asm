	.data
	
	.eqv	SIZE, 10
	.eqv	TRUE, 1
	.eqv	FALSE, 0
	
	.eqv	read_int, 5
	.eqv	print_int10, 1
	
	.align	2
lista:	.space	40		# SIZE * 4
	
	.text
	.globl main
main:	
	la	$t0, lista		# lista
	li	$t1, SIZE
	mulu	$t1, $t1, 4
	addu	$t1, $t0, $t1	# lista + SIZE

for:	
	bge	$t0, $t1, endf	# for (p < lista + SIZE)
	
	li	$v0, read_int
	syscall			# read_int()
	
	sw	$v0, 0($t0)		# *p = read_int();
	
	addiu	$t0, $t0, 4		# p++
	
	j	for
endf:	
	la	$t0, lista
do:
	li	$t2, FALSE		# houveTroca = FALSE; 
	
	li	$t3, 0		# i = 0
	li	$t4, SIZE
	addiu	$t4, $t4, -1 	# SIZE - 1
	
for2:	
	bge	$t3, $t4, endf2	# for (i=0; i < SIZE-1; i++) 
	
if:	
	mulu	$t5, $t3, 4
	addu	$t5, $t0, $t5
	lw	$t6, 0($t5)		# lista[i]
	lw	$t7, 4($t5)		# lista[i+1]
	bleu	$t6, $t7, skip	# if (lista[i] > lista[i+1]) 
	
	sw	$t7, 0($t5)		# lista[i] = lista[i+1]; 
	sw	$t6, 4($t5)		# lista[i+1] = lista[i];
	
	li	$t2, TRUE		# houveTroca = TRUE; 
	
skip:
	addiu	$t3, $t3, 1		# i++
	j	for2

endf2:
	beq	$t2, TRUE, do	# while (houveTroca==TRUE); 
	
for3:	
	bge	$t0, $t1, endf3	# for (p < lista + SIZE)
	
	lw	$a0, 0($t0)
	li	$v0, print_int10
	syscall			# print_int10(*p)
	
	addiu	$t0, $t0, 4		# p++
	
	j	for3

endf3:	
		
	jr	$ra
	
# Mapa de Registos:
# $t0 = lista
# $t1 = lista + SIZE
# $t2 = houveTroca
# $t3 = i
# $t4 = SIZE - 1
# $t5 = lista
# $t6 = lista[i]
# %t7 = lista[i+1]