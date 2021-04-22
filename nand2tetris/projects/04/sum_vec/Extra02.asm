// Calculate the sum of all elements in an array
// The base address is in R0, the size is in R1; store
// the result in R2

@R2
M=0

(LOOP)
    @R1
    MD=M-1
    @END
    D;JLT
    @R0
    A=M+D
    D=M
    @R2
    M=D+M

    @LOOP
    0;JMP
(END)
    @END
    0;JMP
