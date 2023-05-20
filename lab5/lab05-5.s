.data
string:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
    lui s0, %hi(string)
    addi s0, s0, %lo(string)
    add a0, zero, s0

    addi s1, zero, 20
    addi a1, zero, 20

    addi t0, zero, 6
    ecall

    addi s3, zero, 32

    addi s0, zero, 0
for:
    beq s0, s1, print

    lb t0, a0, 0

    addi a0, a0, 1
    addi s0, s0, 1
    bne t0, s3, for
    addi a1, a1, -1

    j for

print:
    add a0, zero, a1
    addi t0, zero, 1
    ecall

    ret