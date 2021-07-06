main:
# TODO: push s0 to the stack
    addi sp, sp, -4
    sw sp, s0, 0

    # read the number of strings
    addi t0, zero, 4
    ecall
    
    # save the number of strings
    addi s0, a0, 0

    addi t1, s0, 0
    addi t0, zero, 6
    addi a1, zero, 20
    read_strings_loop: 
        beq t1, zero, read_strings_end
        addi sp, sp, -20
        addi a0, sp, 0
        ecall
        addi t1, t1, -1
        j read_strings_loop
    
    read_strings_end:
    addi t1, s0, 0

    print_strings_loop:
        beq t1, zero, print_strings_end

        # print the string
        addi t0, zero, 3
        addi a0, sp, 0
        ecall

        # print a newline
        addi t0, zero, 2
        addi a0, zero, 0xa
        ecall

        addi sp, sp, 20
        addi t1, t1, -1
        j print_strings_loop

    print_strings_end:
        lw s0, sp, 0
        addi sp, sp, 4
        ret
