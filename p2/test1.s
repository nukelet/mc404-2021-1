.section .data

# vec_a = 12, 6, 416, 2
vec_a:
    .word 0x0006000c
    .word 0x01a00002

.section .text
main:
    lui a0, %hi(vec_a)
    addi a0, a0, %lo(vec_a)

    addi a1, zero, 4

    addi sp, sp, -4
    sw ra, 0(sp)

    call SomaVetor

    lw ra, 0(sp)
    addi sp, sp, 4

    j end

end:
    ret

# SomaVetor(short* a, int size)
# a: a0, size: a1
# retorna a soma dos elementos no vetor
SomaVetor:
    # t0 = 0
    addi t0, zero, 0
    # a1 = a0 + size*2 (address after last element)
    slli a1, a1, 1
    add a1, a0, a1

    soma_vetor_loop:
        beq a0, a1, soma_vetor_end
        lh t1, a0, 0
        add t0, t0, t1
        addi a0, a0, 2
        j soma_vetor_loop

    soma_vetor_end:
        add a0, zero, t0
