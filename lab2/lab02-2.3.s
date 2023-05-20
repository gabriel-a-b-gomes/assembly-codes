main:
  # Le um numero do teclado e armazena em a0
  addi t0, zero, 4
  ecall

  beq a0, zero, fim

  # Soma 2 ao valor de a0
  add s0, zero, a0
  addi a0, s0, 2

  # Imprima o valor de a0 na tela
  addi t0, zero, 1
  ecall

  # Va novamente para o main e recomece a execucao
  j main
fim: 
  ret