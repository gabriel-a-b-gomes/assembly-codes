.data
    str1: .string ""
.text
main:
    addi sp, sp, -12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    la s0, str1

    mv a0, s0
    li a1, 30
    call gets

    call strlen

    mv a1, a0
    li a0, 9
    ecall

    mv a1, s0
    call strcpy

    mv s1, a0

    li a0, 4
    mv a1, s1
    ecall     

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)
    
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12

    li a0, 10       # Encerra o programa
    ecall
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