# int strlen(char* str)
# returns: size of string in a0
strlen:
    addi t0, zero, 0

    strlen_loop:
        lbu t1, a0, 0
        beq t1, zero, strlen_end_loop
        addi a0, a0, 1
        addi t0, t0, 1
        j strlen_loop

    strlen_end_loop:
        addi a0, t0, 0
        ret

# void ImprimeMaiuscula(char* s)
# prints a string in uppercase
ImprimeMaiuscula:
    addi sp, sp, -4
    sw ra, sp, 0
    
    call Maiuscula

    # push string address
    addi sp, sp, -4
    sw a0, sp, 0

    call strlen

    addi t0, zero, 3
    addi a1, a0, 0

    # pop string address and store in a0
    lw a0, sp, 0
    addi sp, sp, 4

    # print string to console
    ecall

    lw ra, sp, 0
    addi sp, sp, 4

    ret
