.section .rodata
str1:
# 0x48656c6c "Hell" 
# 0x6f20576f "o Wo"
# 0x726c6421 "rld\n"
# 0x00000000 "\0"
# all this needs to be inverted (little-endianness)
    .word 0x6c6c6548
    .word 0x6f57206f
    .word 0x0A646c72
    .word 0x00000000

str2:
# 0x62727568 "bruh"
# 0x0000000A "\n\0"
    .word 0x68757262
    .word 0x0000000A

str3:
# slightly modified version of str1
    .word 0x6c6c6548
    .word 0x6f57206f
    .word 0x64646c72
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000

str4:
# bruhurb\0
# 0x62727568
# 0x75726200
    .word 0x68757262
    .word 0x00627275

.section .text
main:
    lui a0, %hi(str4)
    addi a0, a0, %lo(str4)

    addi sp, sp, -4
    sw ra, sp, 0

    # addi sp, sp, -4
    # sw a0, sp, 0

    # call strlen
    # # store string size in a1
    # addi a1, a0, 0
    # # pop string address and store in a0
    # lw a0, sp, 0
    # addi sp, sp, 4
    # # set t0 to the system call id for printing strings
    # addi t0, zero, 3
    # # system call
    # ecall

    # call Maiuscula

    # addi t0, zero, 3
    # ecall

    call Palindrome

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

# int Palindrome(char* s)
# returns: a0=1 if the string is a palindrome, a0=0 otherwise
Palindrome:
    addi sp, sp, -4
    sw ra, sp, 0
    
    # push string address
    addi sp, sp, -4
    sw a0, sp, 0

    call strlen
   
    # a1 = strlen(s) - 1 = n-1
    addi a1, a0, -1

    # pop string address
    lw a0, sp, 0
    addi sp, sp, 4

    # a1 = s + (n-1),
    # i.e., points to the end of s
    add a1, a0, a1

    palindrome_loop:
        lbu t0, a0, 0
        lbu t1, a1, 0
        beq t0, zero, palindrome_loop_end
        bne t0, t1, not_palindrome
        addi a0, a0, 1
        addi a1, a1, -1
        j palindrome_loop
        
    palindrome_loop_end:
        addi a0, zero, 1
        j palindrome_ret

    not_palindrome:
        addi a0, zero, 0
        j palindrome_ret
    
    palindrome_ret:
        lw ra, sp, 0
        addi sp, sp, 4
        ret
