.data
matriz:
    .word 0
    .word 0
    .word 0

    .word 0
    .word 0
    .word 0
.text

main:
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

    addi s2, zero, 2
    addi s3, zero, 3

    addi s4, zero, 0
    addi s7, zero, 0
for_linhas:
    beq s4, s2, print

    # Percorrem as matrizes com indices
    addi s5, zero, 0

for_coluna:
    beq s5, s3, fim_for_coluna

    add t0, s4, s5
    lw t1, s0, 0
    add t1, zero, t0
    sw t1, s0, 0

    addi s5, s5, 1
    addi s0, s0, 4
    addi s7, s7, 4
    j for_coluna
fim_for_coluna:
    addi s4, s4, 1
    j for_linhas

print:
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

    addi s9, zero, 16

    addi s4, zero, 0
    addi s7, zero, 0
for_p_linhas:
    beq s4, s2, fim

    # Percorrem as matrizes com indices
    addi s5, zero, 0

for_p_col:
    beq s5, s3, fim_for_p_col

    lw a0, s0, 0
    addi t0, zero, 1
    ecall

    addi s5, s5, 1
    addi s0, s0, 4
    addi s7, s7, 4
    j for_p_col
fim_for_p_col:
    addi s4, s4, 1
    j for_p_linhas
fim:
    ret
