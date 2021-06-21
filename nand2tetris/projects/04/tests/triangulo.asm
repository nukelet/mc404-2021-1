// carrega valores de teste
// @6
// D=A
// @R0
// M=D
// 
// @4
// D=A
// @R1
// M=D
// 
// @3
// D=A
// @R2
// M=D

// programa em si
@R0
D=M
@R1
D=D+M
@R2
D=D-M
@NOT_TRIANGLE
D;JLE

@R1
D=M
@R2
D=D+M
@R0
D=D-M
@NOT_TRIANGLE
D;JLE

@R2
D=M
@R0
D=D+M
@R1
D=D-M
@NOT_TRIANGLE
D;JLE

@R4
M=1

@END
0;JMP

(NOT_TRIANGLE)
    @R4
    M=0

(END)
    @END
    0;JMP
