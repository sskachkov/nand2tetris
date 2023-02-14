//Command "push constant 3030" start.
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 3030" end.

//Command "pop pointer 0" start.
@3
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
//Command "pop pointer 0" end.
//Command "push constant 3040" start.
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 3040" end.

//Command "pop pointer 1" start.
@4
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
//Command "pop pointer 1" end.
//Command "push constant 32" start.
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32" end.

//Command "pop this 2" start.
@THIS
D=M
@2
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
//Command "pop this 2" end.
//Command "push constant 46" start.
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 46" end.

//Command "pop that 6" start.
@THAT
D=M
@6
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
//Command "pop that 6" end.
//Command "push pointer 0" start.
@3
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push pointer 0" end.

//Command "push pointer 1" start.
@4
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push pointer 1" end.

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

//Command "push this 2" start.
@2
D=A
@THIS
A=M
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push this 2" end.

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

//Command "push that 6" start.
@6
D=A
@THAT
A=M
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push that 6" end.

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

