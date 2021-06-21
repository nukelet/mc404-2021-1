# SomaVetor(int* a, int* b, int* c, int size)
# a: a0, b: a1, c: a2, size: a3
# Does a[i] = b[i] + c[i]
SomaVetor:
    # s0 = offset after last element = 4*size
    add s0, zero, a3
    slli s0, s0, 2
    
    # t0 = offset = 0, 4, ...
    addi t0, zero, 0
    
    sum_vec_loop:
        bge t0, s0, sum_vec_ret

        # t1 = [a1], t2 = [a2]
        lw t1, a1, 0
        lw t2, a2, 0
        # [a2] = t1 + t2
        add t1, t1, t2
        sw t1, a0, 0

        # increment pointers
        addi a0, a0, 4
        addi a1, a1, 4
        addi a2, a2, 4
        # increment offset
        addi t0, t0, 4

        j sum_vec_loop

    sum_vec_ret:
        ret
