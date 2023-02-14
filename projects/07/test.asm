//Command "push constant 10" start.
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 10" end.

//Command "pop local 1" start.
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//Command "pop local 1" end.
