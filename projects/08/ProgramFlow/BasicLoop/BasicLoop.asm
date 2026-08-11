//Command "push constant 0" start.
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 0" end.

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
(BasicLoop__LOOP_START)
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

//Command "push constant 1" start.
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 1" end.

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

//Command "pop argument 0" start.
@ARG
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
//Command "pop argument 0" end.
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

//Command if-goto start.
@SP
M=M-1
A=M
D=M
@BasicLoop__LOOP_START
D;JNE
//Command if-goto end.
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

