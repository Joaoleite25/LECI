# Mapa de registos:
# $a0 : ms

delay:   
    li $v0, 12
    syscall

while:
    li $v0, 11
    syscall

    li $t0, 20000
    mul $t0, $t0, $a0

    bge $v0, $t0, endw
    j while

endw:
    jr $ra