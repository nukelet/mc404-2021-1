// Calculate the absolute value of the number in R0
// and store the result in R1

@R0
D=M
@R1
M=D
@END
D;JGE

@R1
M=-M

(END)
    @END
    0;JMP
