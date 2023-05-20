main: 
    addi t0, zero, 4
    ecall

    add s0, zero, a0

    add a0, zero, s0

    addi t0, zero, 1
    ecall
    ret