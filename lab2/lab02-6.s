main:
    # le um numero do teclado
  addi t0, zero, 4
  ecall    
  
  # variavel auxiliar com valor 10
  addi s1, zero, 10

  # salta se a0 eh maior ou igual a 10, i.e., se ao dimunuir 10 ainda eh positivo
  bge a0, s1, is_positive

  # subtrai s1 de a0, o resultado eh justamente o valor negativo
  sub s0, s1, a0

  # printa na tela o traco de menos -
  addi a0, zero, 45
  addi t0, zero, 2  
  ecall

  add a0, zero, s0
  j print
  
is_positive:
  # subtrai 10 do numero lido 
  addi a0, a0, -10 
 
print:
  addi t0, zero, 1
  ecall 
  ret