.data
    str: .string ""
.text
main:
    addi sp, sp, -4
    sw ra, 0(sp)

    la a0, str
    call gets

    mv a1, a0
    li a0, 4
    ecall

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall   # Encerra a execução do programa


gets:
    addi sp, sp, -12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    mv s0, a0 # end. inicial da str
    mv s1, a0 # end. iterativo


    li a0, 0x130
    ecall
still_char: 
    addi t1, zero, 1

    li a0, 0x131
    ecall
    mv t0, a0
    beq t0, zero, no_more_char
    beq t0, t1, still_char

    sb a1, 0(s1)
    addi s1, s1, 1
    j still_char
no_more_char:
    sb zero, 0(s1)

    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12
    ret


