main:
	addi t0, zero, 4
	ecall

	addi t1, zero, 3
	and s0, a0, t1

	beq s0, zero, eh_multiplo
	addi a0, zero, 78
	addi t0, zero, 2
	ecall
	j fim
eh_multiplo:
	addi a0, zero, 83
	addi t0, zero, 2
	ecall
fim:
	ret