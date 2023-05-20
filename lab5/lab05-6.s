# declaração do vetor de pontos com 5 posições de 2 inteiros cada
posicoes:
    .word 10 .word 12
    .word 14 .word 11
    .word 10 .word 10
    .word 8 .word 5
    .word 20 .word 1
# função main
main:
# copia o primeiro ponto para os registradores de ponto superior direito
    lui s0, %hi(posicoes)
    addi s0, s0, %lo(posicoes)

    lw s1, s0, 0
    lw s2, s0, 4

    addi s5, zero, 5
# loop para percorrer os demais pontos do vetor
for:
    beq s5, zero, print
  # compara a coordenada x do ponto atual com a coordenada x do ponto superior direito
  
  # compara a coordenada y do ponto atual com a coordenada y do ponto superior direito
    addi s5, s5, -1
    j for
# imprime o ponto superior direito na 
print: 
    add a0, zero, s1
    addi t0, zero, 1
    ecall

    add a0, zero, s2
    addi t0, zero, 1
    ecall
ret