main:
    addi s2, zero, 32

    addi t0, s0, 0
    addi t1, s1, 0
    addi a0, zero, 0

    addi t2, zero, 0

loop:
    bge t2, s2, end

    srl t3, t1, t2
    andi t3, t3, 1

    sll t4, t0, t2
    addi t2, t2, 1

    beq t3, zero, loop
    
    add a0, a0, t4

    j loop

end:
    jr ra
