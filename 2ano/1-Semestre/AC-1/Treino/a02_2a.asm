	.data
	.text
	.globl main
main:	li $t0,0x12345678
	
	sll $t2, $t0, 1
	srl $t3, $t0, 1
	sra $t3, $t0, 1
	
	li $t0, 2
	or $t1, $0, $t0
	srl $t1, $t1, 4
	srl $t1, $t1, 2
	srl $t1, $t1, 1
	or $t2, $0, $t1
	
	jr $ra