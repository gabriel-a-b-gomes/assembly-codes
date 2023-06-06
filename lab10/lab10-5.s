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

    call RecebePessoas

imprimir:
    beq a0, zero, fim_imprimir
    call ImprimePessoa
    j imprimir
fim_imprimir:

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8

    li a0, 10       # Encerra o programa
    ecall
    ret

RecebePessoas:
    addi sp, sp, -20
    sw s3, 16(sp)
    sw s2, 12(sp)
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s1, zero #apontador prox. anterior
mais_um:
    call LePessoa
    mv s3, a0 # guarda o end. dessa pessoa
    mv s2, a0
    call strlen
    beq a0, zero, fim_mais_um
    add s2, s2, a0
    addi s2, s2, 5 # pega o endereco_prox

    bne s1, zero, alterar_prox
    mv s0, s3 # salva o inicio do vetor

    j mudar_prox
alterar_prox:
    sw s3, 0(s1) # armazena o prox.

mudar_prox:
    mv s1, s2 # sobrescreve o endereço
    j mais_um
fim_mais_um:
    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    addi sp, sp, 20
    ret

LePessoa:
    addi sp, sp, -16
    sw s3, 16(sp)
    sw s2, 12(sp)
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    la s0, str # armazena o inicio do vetor

    mv a0, s0
    li a1, 100
    call gets

    call strlen

    mv s3, a0
    addi a1, s3, 9
    li a0, 9
    ecall

    mv a1, s0
    call strcpy

    mv s0, a0

    mv s2, s0 # recebe o valor de s0
    add s2, s2, s3
    addi s2, s2, 1

    la a0, num
    call LeNumero

    sw a0, 0(s2)
    sw zero, 4(s2)

    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
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

    mv a0, s0
    call strlen
    add s0, s0, a0
    addi s0, s0, 1

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

    addi s0, s0, 4
    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12 
    ret


strlen:
    addi t0, zero, 0
len: 
    lbu t1, 0(a0)
    beq t1, zero, fim_string

    addi t0, t0, 1
    addi a0, a0, 1
    j len
fim_string:
    mv a0, t0
    ret


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