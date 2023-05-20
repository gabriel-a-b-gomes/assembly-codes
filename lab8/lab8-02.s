.data
    str1: .string ""
    str2: .string "Teste Teste\n"
.text
main: 
    addi sp, sp, -20
    sw s0, 4(sp)
    sw ra, 0(sp)

    li a0, 4
    la a1, str1
    ecall

    li a0, 4
    la a1, str2
    ecall

    addi a0, zero, 0
    addi a1, zero, 0

    la a0, str1
    la a1, str2

    call strcpy 

    mv a1, a0
    li a0, 4
    ecall

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 20

    addi a0, zero, 10
    ecall   # Encerra a execução do programa


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