main:
	addi t0, zero, 4
	ecall

	addi t1, zero, 1
	and s0, a0, t1

	beq s0, zero, eh_par
	addi a0, zero, 73
	addi t0, zero, 2
	ecall
	j fim
eh_par:
	addi a0, zero, 80
	addi t0, zero, 2
	ecall
fim:
	ret