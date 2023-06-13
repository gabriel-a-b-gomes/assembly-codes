.data
    valor: .string "Valor: "
    maior: .string "Maior: "
    menor: .string "Menor: "
.text
main:
    addi sp, sp, -12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s1, zero
    mv s0, zero

enquanto_n_zero:
    call LeNumero  

    beq a0, zero, eh_zero

    mv t0, a0

    li    a0, 4
    la    a1, valor
    ecall          # Imprime maior

    li a0, 1
    mv a1, t0
    ecall     

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    bgt t0, s1, nao_eh_menor
    mv s1, t0

nao_eh_menor:
    blt t0, s0, nao_eh_maior
    mv s0, t0

nao_eh_maior:
    j enquanto_n_zero
eh_zero:

    li    a0, 4
    la    a1, maior
    ecall          # Imprime maior

    li a0, 1
    mv a1, s0
    ecall     

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    li    a0, 4
    la    a1, menor
    ecall          # Imprime menor

    li a0, 1
    mv a1, s1
    ecall     

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    li a0, 10       # Encerra o programa
    ecall
    ret


LeNumero:
    addi sp, sp, -12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s0, a0 # end. inicial da str
    mv s1, a0 # end. iterativo

    addi t2, zero, 0

    li a0, 0x130
    ecall
still_char_number: 
    addi t1, zero, 1

    li a0, 0x131
    ecall
    mv t0, a0

    beq t0, zero, no_more_char_number
    beq t0, t1, still_char_number
    addi a1, a1, -48
    sb a1, 0(s1)
    addi s1, s1, 1
    j still_char_number
no_more_char_number:
    addi s1, s1, -1

    addi t1, zero, 253

    addi t4, zero, 1
    addi t5, zero, 10
for_invertido:
    blt s1, s0, fim_for_invertido
    lbu t3, 0(s1)

    beq t3, t1, eh_negativo
    mul t3, t3, t4
    add t2, t2, t3
    j base
eh_negativo:
    addi t3, zero, -1
    mul t2, t2, t3
base:
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