.section .data
vec_a:
    .word 12
    .word 1
    .word 13

vec_b:
    .word 2
    .word 5
    .word 10

vec_c:
    .word 12
    .word 1
    .word 13

.section .text
main:
    lui a0, %hi(vec_a)
    addi a0, a0, %lo(vec_a)

    lui a1, %hi(vec_b)
    addi a1, a1, %lo(vec_b)

    lui a2, %hi(vec_c)
    addi a2, a2, %lo(vec_c)

    addi a3, zero, 3

    addi sp, sp, -4
    sw ra, 0(sp)

    call SomaVetor

    lw ra, 0(sp)
    addi sp, sp, 4

    j end

end:
    ret

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

# min(a0, a1)
# returns: min element in a0
min:
    blt a1, a0, L0
    ret

    L0:
        add a0, zero, a1
        ret

# min(int* vec, int size)
# returns: min element in a0
min_vec:
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
