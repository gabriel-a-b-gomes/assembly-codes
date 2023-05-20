.data
    str1: .string "Tudo acontece"
    str2: .string "Inclusive nada"
.text
main:
    addi sp, sp, -12
    sw s1, 8(sp)
    sw s0, 4(sp)
    sw ra, 0(sp)

    la s0, str1
    la s1, str2

    mv a0, s0
    call strlen

    mv a1, a0
    li   a0, 1
    ecall     # Imprime o número
    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    mv a0, s0
    mv a1, s1
    call strcmp

    mv a1, a0
    li   a0, 1
    ecall     # Imprime o número
    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    mv a0, s0
    mv a1, s1
    call strcat

    mv a1, a0
    li a0, 4
    ecall

    li a0, 11
    li a1, 13
    ecall          # Imprime caracter de nova linha (\n)

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12

    addi a0, zero, 10
    ecall   # Encerra a execução do programa

# ********************************

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

# ********************************

strcmp:
    addi t0, zero, 0 # inicialmente iguais

cmp:
    lbu t1, 0(a0)
    lbu t2, 0(a1)

    blt t1, t2, eh_menor
    beq t1, t2, eh_igual

    # eh_maior
    addi t0, zero, 1
    j fim_strcmp
eh_igual:
    beq t1, zero, fim_strcmp

    addi a0, a0, 1
    addi a1, a1, 1
    j cmp

eh_menor:
    addi t0, zero, -1
    j fim_strcmp

fim_strcmp:
    mv a0, t0
    ret

# ********************************

strcat:
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)
    
    mv s0, a0

cat_a0:
    lbu t0, 0(a0)
    beq t0, zero, cat_a1

    addi a0, a0, 1
    j cat_a0
cat_a1:
    lbu t1, 0(a1)
    beq t1, zero, fim_cat

    sb t1, 0(a0)
    addi a0, a0, 1
    addi a1, a1, 1
    j cat_a1
fim_cat:
    sb zero, 0(a0)

    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8
    ret