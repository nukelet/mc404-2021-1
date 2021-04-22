// Find the smallest element in an array
// The base address is in R0, the size in R1;
// store the result in R2

@R0
A=M
D=M
@R2
M=D

(LOOP)
    @R1
    MD=M-1
    @END
    D;JLT

    @R0
    A=M+D
    D=M
    @CURRENT
    M=D
    @R2
    D=M-D
    @LOOP
    D;JLT

    @CURRENT
    D=M
    @R2
    M=D

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
