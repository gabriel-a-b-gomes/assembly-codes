main:
  # Le um numero do teclado e armazena em a0
  addi t0, zero, 4
  ecall
  beq a0, zero, fim
 
  add s0, zero, a0

  # Le um numero do teclado e armazena em a0
  addi t0, zero, 4
  ecall
  beq a0, zero, fim

  add s1, zero, a0

  blt s0, s1, s1_maior
  add a0, zero, s0
  j print
s1_maior: 
  add a0, zero, s1

print: 
  addi t0, zero, 1
  ecall

  # Va novamente para o main e recomece a execucao
  j main
fim: 
  ret