//Command "push constant 111" start.
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 111" end.

//Command "push constant 333" start.
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 333" end.

//Command "push constant 888" start.
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 888" end.

//Command "pop static 8" start.
@24
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//Command "pop static 8" end.
//Command "pop static 3" start.
@19
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//Command "pop static 3" end.
//Command "pop static 1" start.
@17
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//Command "pop static 1" end.
//Command "push static 3" start.
@19
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push static 3" end.

//Command "push static 1" start.
@17
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push static 1" end.

//Command "sub" start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=A-D
@SP
A=M
M=D
@SP
M=M+1
//Command "sub" end.

//Command "push static 8" start.
@24
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push static 8" end.

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

