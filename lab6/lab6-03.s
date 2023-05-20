.data
vetor:
    .word 10
    .word 11
    .word 12
    .word 20
    .word 14
.text

SomaVetor:
    addi t0, zero, 0
for:
    beq  a0, zero, fim
    lw   t1, a1, 0

    add t0, t0, t1

    addi a1, a1, 4
    addi a0, a0, -1
    j    for
fim:
    mv a0, t0
    ret

main:
    addi sp, sp, -12
    sw   s0, sp, 8
    sw   s1, sp, 4
    sw   ra, sp, 0

    addi s0, zero, 5
    lui s1, %hi(vetor)
    addi s1, a0, %lo(vetor)

    mv a0, s0
    mv a1, s1

    call SomaVetor
    addi t0, zero, 1
    ecall

fim_print:
    lw   ra, sp, 0
    lw   s1, sp, 4
    lw   s0, sp, 8
    addi sp, sp, 12
    ret
