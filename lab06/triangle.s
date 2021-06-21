main:
    add t1, s0, s1
    bge s2, t1, else

    add t1, s1, s2
    bge s0, t1, else

    add t1, s2, s0
    bge s1, t1, else

    addi a0, zero, 1
    j end

else:
    addi a0, zero, 0

end:
    jr ra
