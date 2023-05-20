main:
  addi t0, zero, 4
  ecall
  # segredo
  add s0, zero, a0

  addi t0, zero, 4
  ecall
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
  
  add a0, zero, s3
  addi t0, zero, 1
  ecall
  ret