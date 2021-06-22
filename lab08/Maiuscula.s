# char* Maiuscula(char* s)
# converts s to uppercase
# returns: pointer to s
Maiuscula:
    addi s0, a0, 0
   
    # 'a'
    addi s1, zero, 0x61
    # 'z'
    addi s2, zero, 0x7A

    maiuscula_loop:
        lbu t0, a0, 0
        beq t0, zero, maiuscula_loop_end
        addi t1, a0, 0
        addi a0, a0, 1

        # if t0 lt 'a'
        blt t0, s1, maiuscula_loop
        # if 'z' lt t0
        blt s2, t0, maiuscula_loop
        # convert from upper to lower
        andi t0, t0, 0xDF
        sb t0, t1, 0
        j maiuscula_loop

    maiuscula_loop_end:
        addi a0, s0, 0
        ret
