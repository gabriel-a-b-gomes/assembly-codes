.data
vetor:
    .word 10
    .word 11
    .word 12
    .word 13
    .word 14
.text

Multiplica:
    addi sp, sp, -16
    sw s2, sp, 12
    sw s1, sp, 8
    sw s0, sp, 4
    sw ra, sp, 0

    mv s0, a0
    mv s1, a1

    addi s2, zero, 0

for_multiplica:
    beq s1, zero, fim_multiplica
    add s2, s2, s0
    addi s1, s1, -1
    j for_multiplica

fim_multiplica:
    mv a0, s2

    lw ra, sp, 0
    lw s0, sp, 4
    lw s1, sp, 8
    lw s2, sp, 12
    addi sp, sp, 16
    ret


MultiplicaVetor:
    # Movimenta o apontador da pilha 4 posicoes para baixo (16 bytes) e guarda 4 registradores na pilha
    addi sp, sp, -16
    sw   s0, sp, 12
    sw   s1, sp, 8
    sw   s2, sp, 4
    sw   ra, sp, 0

    mv   s0, a0
    mv   s1, a1
    mv   s2, a2

for:
    beq  s0, zero, fim
    lw   a0, s1, 0
    mv   a1, s2
    call Multiplica
    sw   a0, s1, 0
    addi s1, s1, 4
    addi s0, s0, -1
    j    for

fim:
    # Movimenta o apontador da pilha 4 posicoes para cima (16 bytes) e recupera 4 registradores da pilha
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    ret

main:
    addi sp, sp, -16
    sw   s0, sp, 12
    sw   s1, sp, 8
    sw   s2, sp, 4
    sw   ra, sp, 0

    addi s0, zero, 5
    lui s1, %hi(vetor)
    addi s1, a0, %lo(vetor)
    addi s2, zero, 10

    mv a0, s0
    mv a1, s1
    mv a2, s2

    call MultiplicaVetor


for_print:
    beq s0, zero, fim_print
    lw a0, s1, 0
    addi t0, zero, 1
    ecall

    addi s1, s1, 4
    addi s0, s0, -1
    j for_print

fim_print:
    lw   ra, sp, 0
    lw   s2, sp, 4
    lw   s1, sp, 8
    lw   s0, sp, 12
    addi sp, sp, 16
    ret
