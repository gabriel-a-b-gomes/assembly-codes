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
    add s1, zero, t0

    lw t0, s0, 4
    add s1, s1, t0

    lw t0, s0, 8
    add s1, s1, t0

    add a0, zero, s1
    addi t0, zero, 1
    ecall
    ret