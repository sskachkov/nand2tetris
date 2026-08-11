//Command "push constant 7" start.
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 7" end.

//Command "push constant 8" start.
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 8" end.

//Command "add" start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D+A
@SP
A=M
M=D
@SP
M=M+1
//Command "add" end.

