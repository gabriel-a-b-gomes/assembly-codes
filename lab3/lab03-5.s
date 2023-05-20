main:
  addi t0, zero, 4
  ecall
  # segredo
  add s0, zero, a0

recebe: 
  addi t0, zero, 4
  ecall

  beq a0, zero, fim

  # numero a ser codificado
  add s1, zero, a0

  # codifica o numero
  xor s2, s1, s0

  # imprime numero codificado
  add a0, zero, s2
  addi t0, zero, 1
  ecall

  # decodifica o numero
  xor s3, s2, s0
  
  addi a0, zero, 100
  addi t0, zero, 2
  ecall
  addi a0, zero, 32
  addi t0, zero, 2
  ecall

  add a0, zero, s3
  addi t0, zero, 1
  ecall
  j recebe
fim:  
  ret