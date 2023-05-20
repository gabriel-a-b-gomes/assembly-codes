.data
    dois:   .word 0x0 0x0 0x0 0xF 0x1 0xF 0x8 0xF 0x0 0x0 0x0 0x0
    quatro: .word 0x0 0x0 0x0 0x9 0x9 0xF 0x1 0x1 0x0 0x0 0x0 0x0
    oito:   .word 0x0 0x0 0x0 0xF 0x9 0xF 0x9 0xF 0x0 0x0 0x0 0x0
    sete:   .word 0x0 0x0 0x0 0xF 0x1 0x1 0x1 0x1 0x0 0x0 0x0 0x0
    tela:   .word 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    mv t1, zero

    la a0, tela
    la a1, dois
    la a2, quatro
    la a3, oito
    la a4, sete
    call anda_com_numero

    lw ra, 0(sp)
    addi sp, sp, 4

    li a0, 10       # Encerra o programa
    ecall
    ret

anda_com_numero:
    addi sp, sp, -40
    sw s8, 36(sp)
    sw s7, 32(sp)
    sw s6, 28(sp)
    sw s5, 24(sp)
    sw s4, 20(sp)
    sw s3, 16(sp)
    sw s2, 12(sp)
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s0, a0 # tela
    mv s1, a1 # dois
    mv s2, a2 # quatro
    mv s3, a3 # oito
    mv s4, a4 # sete

    li s5, 22
    mv s6, zero

    addi sp, sp, -24
    sw s4, 20(sp) # sete
    sw s3, 16(sp) # oito
    sw s1, 12(sp) # dois
    sw s3, 8(sp) # oito
    sw s2, 4(sp) # quatro
    sw s1, 0(sp) # dois

    mv a0, s0
    lw t0, 0(sp)
    addi sp, sp, 4
    mv a1, t0
    call adiciona_numero

    li t5, 0
    mv t6, zero
    li s7, 17
    li s8, 5

for_anda_numero:
    beq t6, s7, fim_for_anda_numero
    mv a0, s0
    mv a1, t6
    call mostra_numero
    li a0, 200
    call pausa
    addi t6, t6, 1

    bne t6, s8, for_anda_numero # se o deslocamento chegar em zero, adiciona mais um numero
    beq t5, s8, for_anda_numero # se todos os numeros foram mostrados, apenas desloque
    mv a0, s0
    lw t0, 0(sp)
    addi sp, sp, 4
    mv a1, t0
    call adiciona_numero
    mv t6, zero
    addi t5, t5, 1
    j for_anda_numero
fim_for_anda_numero:

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    lw s6, 28(sp)
    lw s7, 32(sp)
    lw s8, 36(sp)
    addi sp, sp, 32
    ret

mostra_numero:
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)

    li t0, 11 # numero total de linhas
    mv s0, a0
    mv t1, a1

for_mostra_numero:
    blt t0, zero, fim_for_mostrar_numero # percorre o monitor de cima para baixo

    li a0, 0x110
    mv a1, t0
    lw t2, 0(s0)
    sll t3, t2, t1
    mv a2, t3
    ecall

    addi t0, t0, -1
    addi s0, s0, 4
    j for_mostra_numero
fim_for_mostrar_numero:
    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8
    ret

adiciona_numero:
    mv t0, a0
    mv t1, a1
    li t2, 11
for_adiciona_numero:
    beq t2, zero, fim_adiciona_numero
    lw t3, 0(t0)
    lw t4, 0(t1)
    slli t3, t3, 5
    add t3, t3, t4
    sw t3, 0(t0)
    addi t0, t0, 4
    addi t1, t1, 4
    addi t2, t2, -1
    j for_adiciona_numero
fim_adiciona_numero:
    ret

pausa:
    mv t0, a0
for_pausa:
    beq t0, zero, fim_for_pausa
    nop
    addi t0, t0, -1
    j for_pausa
fim_for_pausa:
    ret