main: 
    addi t0, zero, 5
    ecall

    add s0, zero, a0

    ori a0, s0, 32

    addi t0, zero, 2
    ecall
    ret