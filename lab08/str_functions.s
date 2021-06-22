.section .rodata
str1:
# 0x48656c6c "Hell" 
# 0x6f20576f "o Wo"
# 0x726c6421 "rld!"
# all this needs to be inverted (little-endianness)
    .word 0x6c6c6548
    .word 0x6f57206f
    .word 0x00646c72

str2:
# 0x62727568 "bruh"
    .word 0x68757262
    .word 0x00000000

str3:
# slightly modified version of str1
    .word 0x6c6c6548
    .word 0x6f57206f
    .word 0x64646c72
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000

.section .text
main:
    lui a1, %hi(str1)
    addi a1, a1, %lo(str1)

    lui a0, %hi(str3)
    addi a0, a0, %lo(str3)
    
    addi sp, sp, -4
    sw ra, sp, 0

    # allocate space for a 16-byte long
    # string on the stack
    # addi sp, sp, -16
    # addi a0, sp, 0
    
    call strcat
    
    # deallocate string
    # addi sp, sp, 16

    lw ra, sp, 0
    addi sp, sp, 4

    ret

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

# char* strcpy(char* destination, char* source)
# returns: a pointer to the dest. string in a0
strcpy:
    addi s0, a0, 0

    strcpy_loop:
        lbu t0, a1, 0
        beq t0, zero, strcpy_end_loop
        sb t0, a0, 0
        addi a0, a0, 1
        addi a1, a1, 1
        j strcpy_loop
    
    strcpy_end_loop:
        addi a0, s0, 0
        ret


# int strcmp(char* str1, char* str2)
# returns: a0=1 if str1 == str2, a0=0 otherwise
strcmp:
    strcmp_loop:
        lbu t0, a0, 0
        lbu t1, a1, 0
        bne t0, t1, strcmp_not_equal
        beq t0, zero, strcmp_end_loop
        addi a0, a0, 1
        addi a1, a1, 1
        j strcmp_loop

    strcmp_end_loop:
        addi a0, zero, 1
        ret

    strcmp_not_equal:
        addi a0, zero, 0
        ret

# char strcat(char* destination, char* source)
# returns: pointer to destination in a0
strcat:
    # push a0's original address to the stack
    addi sp, sp, -4
    sw a0, sp, 0

    strcat_find_end_loop:
        lbu t0, a0, 0
        beq t0, zero, strcat_find_end_loop_end
        addi a0, a0, 1
        j strcat_find_end_loop

    strcat_find_end_loop_end:
        addi sp, sp, -4
        sw ra, sp, 0

        # a0 is already pointing to the end of 
        # the destination string
        call strcpy
        
        lw ra, sp, 0
        addi sp, sp, 4

        # pop a0's original address from the stack
        lw a0, sp, 0
        addi sp, sp, 4
        ret
