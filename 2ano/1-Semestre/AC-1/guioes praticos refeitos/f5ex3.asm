# Mapa de Registos
# houveTroca : $t0
# aux        : $t1
# i          : $t2
# lista      : $t3
# lista+i    : $t4
# lista[i]   : $t5
# lista[i+1] : $t6
# Reg_Temp   : $t7

	.data
	.eqv 	SIZE, 10
	.eqv	TRUE, 1
	.eqv	FALSE, 0

	.eqv	print_string, 4
	.eqv	print_int10, 1
	.eqv	read_int, 5
	
lista:	.space 	40
	.align 	2
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	", "

	.text
	.globl 	main

main:

	li	$t2, 0				# i = 0
	la	$t3, lista			# lista

for1:	bge	$t2, SIZE, endf1		# for(i=0, i < SIZE, i++)

	sll	$t7, $t2, 2			# i*4
	add 	$t4, $t3, $t7			# lista+i

	# print_string(str1)
	la	$a0, str1
	li	$v0, print_string
	syscall

	# read_int()
	li	$v0, read_int
	syscall
	sw	$v0, 0($t4)			# lista[i] = read_int()

	addi	$t2, $t2, 1			# i++;
	j	for1
endf1:

do:	
	li	$t0, FALSE			# houveTroca = FALSE
	li	$t2, 0				# i = 0

for3:	bge	$t2, 9, endf3
	
	sll	$t7, $t2, 2			# i*4
	add 	$t4, $t3, $t7			# lista+i

	lw	$t5, 0($t4)			# lista[i]
	addi	$t7, $t4, 4			# lista+i+1
	lw	$t6, 0($t7)			# lista[i+1]

if:	ble	$t5, $t6, endif			# if (lista[i] > lista[i+1])

	move	$t1, $t5			# aux = lista[i]		
	sw	$t6, 0($t4)			# lista[i] = lista[i+1]
	move	$t6, $t1			# lista[i+1] = aux
	sw	$t6, 0($t7)
	li	$t0, TRUE

endif:
	addi	$t2, $t2, 1			# i++
	j	for3
endf3: 

while:	beq	$t0, TRUE, do			# while (houveTroca == TRUE)


	li	$t2, 0				# i = 0

for2:	bge	$t2, SIZE, endf2

	sll	$t7, $t2, 2			# i*4
	add	$t4, $t3, $t7			# lista+i

	lb	$t5, 0($t4)			# lista[i]

	# print_int10(lista[i])
	move	$a0, $t5
	li	$v0, print_int10
	syscall

	# print_string(str2)
	la	$a0, str2
	li	$v0, print_string
	syscall

	addi	$t2, $t2, 1
	j	for2
endf2:
	jr	$ra				# Fim do Programa