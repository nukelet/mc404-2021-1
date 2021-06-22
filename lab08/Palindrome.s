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
