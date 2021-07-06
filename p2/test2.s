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
    lui a0, %hi(str2)
    addi a0, a0, %lo(str2)

    addi sp, sp, -4
    sw ra, sp, 0

    call TrazPraFrenteMinuscula

    addi t0, zero, 3
    addi a1, zero, 8
    ecall

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

# char* Minuscula(char* s)
# converts s to lowercase
# returns: pointer to s
Minuscula:
    addi sp, sp, -12
    sw s0, sp, 0
    sw s1, sp, 4
    sw s2, sp, 8

    addi s0, a0, 0
   
    # 'a'
    # addi s1, zero, 0x61
    # 'z'
    # addi s2, zero, 0x7A

    # 'A'
    addi s1, zero, 0x41
    # 'Z'
    addi s2, zero, 0x5A

    minuscula_loop:
        lbu t0, a0, 0
        beq t0, zero, minuscula_loop_end
        addi t1, a0, 0
        addi a0, a0, 1

        # if t0 lt 'A'
        blt t0, s1, minuscula_loop
        # if 'Z' lt t0
        blt s2, t0, minuscula_loop
        # convert from upper to lower
        ori t0, t0, 0x20
        sb t0, t1, 0
        j minuscula_loop

    minuscula_loop_end:
        addi a0, s0, 0

        lw s0, sp, 0
        lw s1, sp, 4
        lw s2, sp, 8
        addi sp, sp, 12

        ret

# TrazPraFrenteMinuscula(char* s)
# retorna em a0 a string de tras pra frente com
# todos os caractares em minusculo
TrazPraFrenteMinuscula:
    addi sp, sp, -4
    sw ra, sp, 0

    addi sp, sp, -4
    sw s0, sp, 0
    
    # s0 = s
    addi s0, a0, 0

    call Minuscula
    call strlen
    
    # a1 = strlen(s) = n
    addi a1, a0, 0
    # a0 = s
    addi a0, s0, 0
    # a1 = s + (n-1) (ultima posicao)
    add a1, a0, a1
    addi a1, a1, -1

    func_loop:
        blt a1, a0, func_ret
        lbu t0, a0, 0
        lbu t1, a1, 0
        sb t0, a1, 0
        sb t1, a0, 0
        addi a0, a0, 1
        addi a1, a1, -1
        j func_loop

    func_ret:
        addi a0, s0, 0

        lw s0, sp, 0
        addi sp, sp, 4
        lw ra, sp, 0
        addi sp, sp, 4
        ret
