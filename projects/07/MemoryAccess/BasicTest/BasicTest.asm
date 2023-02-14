//Command "push constant 10" start.
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 10" end.

//Command "pop local 0" start.
@LCL
D=M
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//Command "pop local 0" end.
//Command "push constant 21" start.
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 21" end.

//Command "push constant 22" start.
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 22" end.

//Command "pop argument 2" start.
@ARG
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
//Command "pop argument 2" end.
//Command "pop argument 1" start.
@ARG
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
//Command "pop argument 1" end.
//Command "push constant 36" start.
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 36" end.

//Command "pop this 6" start.
@THIS
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
//Command "pop this 6" end.
//Command "push constant 42" start.
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 42" end.

//Command "push constant 45" start.
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 45" end.

//Command "pop that 5" start.
@THAT
D=M
@5
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
//Command "pop that 5" end.
//Command "pop that 2" start.
@THAT
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
//Command "pop that 2" end.
//Command "push constant 510" start.
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 510" end.

//Command "pop temp 6" start.
@11
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
//Command "pop temp 6" end.
//Command "push local 0" start.
@LCL
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push local 0" end.

//Command "push that 5" start.
@5
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
//Command "push that 5" end.

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

//Command "push argument 1" start.
@1
D=A
@ARG
A=M
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push argument 1" end.

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

//Command "push this 6" start.
@6
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
//Command "push this 6" end.

//Command "push this 6" start.
@6
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
//Command "push this 6" end.

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

//Command "push temp 6" start.
@11
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push temp 6" end.

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

