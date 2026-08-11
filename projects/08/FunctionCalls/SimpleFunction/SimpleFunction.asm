//Function header SimpleFunction.test start.
(SimpleFunction.test)
//Command "push constant 0" start.
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 0" end.

//Command "push constant 0" start.
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 0" end.

//Function header SimpleFunction.test end.
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

//Command "push local 1" start.
@1
D=A
@LCL
A=M
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push local 1" end.

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

//Command "not" start.
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
//Command "not" end.

//Command "push argument 0" start.
@ARG
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push argument 0" end.

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

//return start
@LCL
D=M
@frame
M=D
@5
A=D-A
D=M
@retAddr
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@frame
D=M
@1
A=D-A
D=M
@THAT
M=D
@frame
D=M
@2
A=D-A
D=M
@THIS
M=D
@frame
D=M
@3
A=D-A
D=M
@ARG
M=D
@frame
D=M
@4
A=D-A
D=M
@LCL
M=D
@retAddr
A=M
0;JMP
//return end
