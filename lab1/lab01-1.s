main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall
  add s0, zero, a0
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
  ecall
  add s1, zero, a0
  add a0, s1, s0
  addi t0, zero, 1
  ecall
  xor a0, s1, s0
  addi t0, zero, 1
  ecall
  sub a0, s1, s0
  addi t0, zero, 1
  ecall
  and a0, s1, s0
  addi t0, zero, 1
  ecall
  sll a0, s1, s0
  addi t0, zero, 1
  ecall
  srl a0, s1, s0
  addi t0, zero, 1
  ecall
  ret