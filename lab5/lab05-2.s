.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
main: 
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)
    lw t0, s0, 0
    addi t0, t0, 1

    sw t0, s0, 0

    lw t0, s0, 4
    addi t0, t0, 1

    sw t0, s0, 4

    lw t0, s0, 8
    addi t0, t0, 1

    sw t0, s0, 8

    lw a0, s0, 0
    addi t0, zero, 1
    ecall

    lw a0, s0, 4
    addi t0, zero, 1
    ecall

    lw a0, s0, 8
    addi t0, zero, 1
    ecall

    ret