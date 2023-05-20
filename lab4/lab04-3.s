main: 
    addi t0, zero, 5
    ecall

    add s0, zero, a0

    andi a0, s0, 223

    addi t0, zero, 2
    ecall
    ret