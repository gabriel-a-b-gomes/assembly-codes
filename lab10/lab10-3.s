.data
    nome: .string "Nome: "
    idade: .string "Idade: "
    str: .string ""
    num: .string ""
.text
main:
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)

    call LePessoa

    mv s0, a0

    call ImprimePessoa

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8

    li a0, 10       # Encerra o programa
    ecall
    ret


LePessoa:
    addi sp, sp, -16
    sw s2, 12(sp)
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    li a0, 9
    li a1, 58
    ecall

    mv s0, a0 # armazena o inicio do vetor

    la a0, str
    li a1, 50
    call gets

    mv a1, a0
    mv a0, s0
    call strcpy

    mv s2, s0 # recebe o valor de s0
    addi s2, s2, 50

    la a0, num
    call LeNumero

    sw a0, 0(s2)
    sw zero, 4(s2)

    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 16
    ret


ImprimePessoa:
    addi sp, sp, 12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s0, a0

    li    a0, 4
    la    a1, nome
    ecall          # Imprime nome

    li a0, 4
    mv a1, s0
    ecall     

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    addi s0, s0, 50

    lw s1, 0(s0)

    li    a0, 4
    la    a1, idade
    ecall          # Imprime idade

    li    a0, 1
    mv    a1, s1
    ecall

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12 


gets:
    addi sp, sp, -16
    sw s2, 12(sp)
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s0, a0 # end. inicial da str
    mv s1, a0 # end. iterativo

    mv s2, a1

    li a0, 0x130
    ecall
still_char: 
    addi t1, zero, 1

    li a0, 0x131
    ecall
    mv t0, a0

    beq s2, zero, no_more_char 
    beq t0, zero, no_more_char
    beq t0, t1, still_char

    sb a1, 0(s1)
    addi s1, s1, 1
    addi s2, s2, -1
    j still_char
no_more_char:
    sb zero, 0(s1)

    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 16
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


strcpy:
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s0, a0

while: 
    lbu t1, 0(a1)
    beq t1, zero, fim_while
    sb t1, 0(a0)

    addi a0, a0, 1
    addi a1, a1, 1
    j while
fim_while:
    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8
    ret