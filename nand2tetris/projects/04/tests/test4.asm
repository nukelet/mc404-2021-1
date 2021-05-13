@4
D=A
@R1
M=D

D=0
@R0
M=D

(LOOP)
  @R1
  D=M
  @FIM
  D;JEQ
  @R0
  M=M+D
  D=D-1
  @R1
  M=D
  @LOOP
  0;JMP
(FIM)
  @FIM
  0;JMP
