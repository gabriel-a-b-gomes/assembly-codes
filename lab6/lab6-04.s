TamanhoString:
    addi sp, sp, -4
    sw ra, sp, 0

    addi t2, zero, 32
    addi t0, zero, 0
for:
    lbu t1, a0, 0
    beq t1, t2, fim
    addi t0, t0, 1
    addi a0, a0, 1
    j for
fim:
    mv a0, t0

    lw ra, sp, 0
    addi sp, sp, 4
    ret

main:
    addi sp, sp, -32
    sw ra, sp, 0

    addi a1, zero, 28
    addi a0, sp, 4
    addi t0, zero, 6
    ecall

    mv s0, a0

    call TamanhoString
    addi t0, zero, 1
    ecall

    lw ra, sp, 0
    addi sp, sp, 32
    ret