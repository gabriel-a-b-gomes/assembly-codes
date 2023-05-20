main:
    # le um numero do teclado
  addi t0, zero, 4
  ecall 

  add s0, zero, a0

  addi t0, zero, 4
  ecall  
  
  # variavel recebe o valor a ser subtraido
  add s1, zero, a0

  # salta se s0 eh maior ou igual a s1, i.e., se ao dimunuir s1 ainda eh positivo
  bge s0, s1, is_positive

  # subtrai s1 de a0, o resultado eh justamente o valor negativo
  sub s0, s1, s0

  # printa na tela o traco de menos -
  addi a0, zero, 45
  addi t0, zero, 2  
  ecall

  add a0, zero, s0
  j print
  
is_positive:
  # subtrai 10 do numero lido 
  sub a0, s0, s1 
 
print:
  addi t0, zero, 1
  ecall 
  ret