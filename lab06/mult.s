main:
    addi t0, s0, 0
    addi t1, s1, 0
    addi a0, zero, 0

loop:
    beq t0, zero, end
    add a0, a0, t1
    addi t0, t0, -1
    j loop

end:
    jr ra
