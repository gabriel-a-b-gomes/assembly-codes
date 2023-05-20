main:
  addi t0, zero, 4
  ecall
  add s0, zero, a0

  addi s1, zero, 31

for:
  blt s1, zero, fim
  srl s2, s0, s1

  addi t1, zero, 1
  and s3, s2, t1

  add a0, zero, s3
  beq a0, zero, eh_zero
  addi a0, zero, 49
  j imprime
eh_zero:
  addi a0, zero, 48
imprime:
  addi t0, zero, 2
  ecall

  addi s1, s1, -1
  j for
fim:
  ret