main:
  #Inicializa as variaveis para o for
  #Ira iniciar 10 vezes, quando s1 = 9
  addi s1, zero, 9
for: 
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

  addi s1, s1, -1
  # Va novamente para o main e recomece a execucao
  bge s1, zero, for
fim: 
  ret