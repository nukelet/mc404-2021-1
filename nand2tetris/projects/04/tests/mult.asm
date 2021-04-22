@23
D=A
@x
M=D
@51
D=A
@y
M=D
@prod
M=0

(LOOP)
    @prod
    D=M
    @x
    D=D+M
    @prod
    M=D

    @y
    M=M-1
    D=M
    @LOOP
    D;JGT

(END)
    @END
    0;JMP
