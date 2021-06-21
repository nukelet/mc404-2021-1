# min(a0, a1)
# returns: min element in a0
min:
    blt a1, a0, L0
    ret

    L0:
        add a0, zero, a1
        ret

# MenorVetor(int* vec, int size)
# returns: min element in a0
MenorVetor:
    # push return address
    addi sp, sp, -4
    sw ra, 0(sp)

    # s0 = int* vec
    add s0, zero, a0

    # s1 = s0 + a1*4 (address after last element)
    add s1, zero, a1
    slli s1, s1, 2
    add s1, s1, s0

    # t0 = s0 + offset = s0 + 0, s0 + 4, ...
    add t0, zero, s0

    lw a0, 0(s0)

    min_vec_loop:
        bge t0, s1, min_vec_ret
        lw a1, t0, 0

        call min;

        addi t0, t0, 4
        j min_vec_loop

    min_vec_ret:
        # pop return address
        lw ra, 0(sp)
        addi sp, sp, 4
        ret
