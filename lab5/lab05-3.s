.data
vetor1:
    .word 20
    .word 50
    .word 02
    .word 08
    .word 27
vetor2:
    .word 23
    .word 39
    .word 92
    .word 76
    .word 01
vetor3:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
    lui s0, %hi(vetor1)
    addi s0, s0, %lo(vetor1)

    lui s1, %hi(vetor2)
    addi s1, s1, %lo(vetor2)

    lui s2, %hi(vetor3)
    addi s2, s2, %lo(vetor3)

    lw t0, s0, 0
    lw t1, s1, 0
    add t2, t0, t1
    sw t2, s2, 0

    lw t0, s0, 4
    lw t1, s1, 4
    add t2, t0, t1
    sw t2, s2, 4

    lw t0, s0, 8
    lw t1, s1, 8
    add t2, t0, t1
    sw t2, s2, 8

    lw t0, s0, 12
    lw t1, s1, 12
    add t2, t0, t1
    sw t2, s2, 12

    lw t0, s0, 16
    lw t1, s1, 16
    add t2, t0, t1
    sw t2, s2, 16

    lw a0, s2, 0
    addi t0, zero, 1
    ecall

    lw a0, s2, 4
    addi t0, zero, 1
    ecall

    lw a0, s2, 8
    addi t0, zero, 1
    ecall

    lw a0, s2, 12
    addi t0, zero, 1
    ecall

    lw a0, s2, 16
    addi t0, zero, 1
    ecall

    ret



