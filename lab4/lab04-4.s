main: 
    addi t0, zero, 5
    ecall

    add s0, zero, a0

    addi t0, zero, 65
    blt s0, t0, print
    
    addi t0, zero, 90
    blt s0, t0, maiuscula

    addi t0, zero, 96
    blt s0, t0, print

    addi t0, zero, 123
    bge s0, t0, print

    # se chegou ate aqui eh minuscula
    andi a0, s0, 223
    j print

maiuscula:
    ori a0, s0, 32

print:
    addi t0, zero, 2
    ecall
    ret