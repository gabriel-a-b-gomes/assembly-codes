.data 
    entrada: .string "" 
.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    call LeNumero

    mv a1, a0
    li   a0, 1
    ecall     # Imprime o número
    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall   # Encerra a execução do programa
    ret

LeNumero:
    addi sp, sp, -12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    la s0, entrada # end. inicial da str
    la s1, entrada # end. iterativo

    addi t2, zero, 0

    li a0, 0x130
    ecall
still_char: 
    addi t1, zero, 1

    li a0, 0x131
    ecall
    mv t0, a0

    beq t0, zero, no_more_char
    beq t0, t1, still_char
    addi a1, a1, -48
    sb a1, 0(s1)
    addi s1, s1, 1
    j still_char
no_more_char:
    addi s1, s1, -1

    addi t4, zero, 1
    addi t5, zero, 10
for_invertido:
    blt s1, s0, fim_for_invertido
    lbu t3, 0(s1)

    mul t3, t3, t4

    add t2, t2, t3
    mul t4, t4, t5
    addi s1, s1, -1
    j for_invertido

fim_for_invertido:

    mv a0, t2

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12
    ret