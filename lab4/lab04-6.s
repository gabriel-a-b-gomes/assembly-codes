main:
    # Indice que vai shiftando na entrada
    addi s1, zero, 28
while:
    addi t0, zero, 4
    ecall

    # se eh igual a 0 para
    beq a0, zero, fim

    add s0, zero, a0

    # laco que itera enquanto o s1 eh maior que 0
enquanto_s1:
    blt s1, zero, fim_enquanto_s1

    # faz o shift dos bits
    srl s2, s0, s1

    # pega os 4 primeiros bits
    andi s3, s2, 15

    addi t0, zero, 10
    blt s3, t0, eh_numero

    # se o hex eh letra soma 55
    addi s3, s3, 55
    j print

    # se o hex eh numero soma 48
eh_numero: 
    addi s3, s3, 48

# printa o numero no formato hex
print:
    add a0, zero, s3
    addi t0, zero, 2
    ecall

    # diminui o indice que faz o shift em 4, para agrupar os bits em 4
    addi s1, s1, -4

    j enquanto_s1

fim_enquanto_s1:
    # printa h
    addi a0, zero, 104
    addi t0, zero, 2
    ecall

    j while
fim:
    ret