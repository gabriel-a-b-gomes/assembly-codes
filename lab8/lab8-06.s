.data
    str: .string "reverte"
.text
main: 
    addi sp, sp, -8
    sw s0, 4(sp)
    sw ra, 0(sp)

    la s0, str

    mv a0, s0
    call strrev

    