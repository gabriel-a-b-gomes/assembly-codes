.data
operacao:
    .word 0 
    .word 43
    .word 0 
    .word 45 
.text
soma: 
    add a0, a0, a1
    ret
subtracao:
    sub a0, a0, a1
    ret

main:
    addi sp, sp, -24
    sw s4, sp, 20
    sw s3, sp, 16
    sw s2, sp, 12
    sw s1, sp, 8
    sw s0, sp, 4
    sw ra, sp, 0

    lui s0, %hi(operacao)
    addi s0, s0, %lo(operacao)

    lui t0, %hi(soma)
    addi t0, t0, %lo(soma)
    sw t0, s0, 0

    lui t0, %hi(subtracao)
    addi t0, t0, %lo(subtracao)
    sw t0, s0, 8

    addi t0, zero, 4
    ecall
    mv s1, a0

    # Recebe op
    addi t0, zero, 5
    ecall
    mv s3, a0

    addi t0, zero, 4
    ecall
    mv s2, a0

    mv a0, s1
    mv a1, s2

    lw t0, s0, 4
    beq s3, t0, somar
    lw t0, s0, 12
    bne s3, t0, fim
    #subtracao
    lw t1, s0, 8
    call subtracao
    j print
somar:
    lw t1, s0, 0
    call soma

print: 
    addi t0, zero, 1
    ecall
fim:
    lw s4, sp, 20
    lw s3, sp, 16
    lw s2, sp, 12
    lw s1, sp, 8
    lw s0, sp, 4
    lw ra, sp, 0
    addi sp, sp, 24
    ret
