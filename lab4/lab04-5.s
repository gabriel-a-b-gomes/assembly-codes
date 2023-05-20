main: 
    addi t0, zero, 4
    ecall

    addi t0, zero, 10
    blt a0, t0, eh_numero

    addi a0, a0, 55
    j print

eh_numero: 
    addi a0, a0, 48

print: 
    addi t0, zero, 2
    ecall

    addi a0, zero, 104
    addi t0, zero, 2
    ecall

    ret