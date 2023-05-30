main:
  li ra, 34921
  mul s0, s7, a0
  xor t1, t5, a5
  beq s0, s7, label

  lw zero, 16(gp)

  li s0, 239239

  sw t2, 16(tp)

  lui a4, 39293

  call teste
  slli a0, t6, 4
  slli t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
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

label:
  ret

teste:
  ret