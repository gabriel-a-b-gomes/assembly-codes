main:
	addi t0, zero, 4
	ecall

	# se recebe 0 para
	beq a0, zero, fim

	# Verifica se eh par
	addi t1, zero, 1
	and s0, a0, t1

	beq s0, zero, eh_par
	# se eh impar adiciona em s1
	add s1, s1, a0
	j main
eh_par:
	# se eh par adiciona em s2
	add s2, s2, a0
	j main
fim:
	# Verifica se o numero eh positivo
	bge s1, s2, eh_positivo
	sub s0, s2, s1
	addi a0, zero, 45
  	addi t0, zero, 2  
  	ecall

  	add a0, zero, s0
  	j imprime
eh_positivo:
	sub a0, s1, s2

imprime:
	addi t0, zero, 1
	ecall
	ret