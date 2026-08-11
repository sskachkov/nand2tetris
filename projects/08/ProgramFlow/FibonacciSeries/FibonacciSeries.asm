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
//Command "push constant 0" start.
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 0" end.

//Command "pop that 0" start.
@THAT
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
//Command "pop that 0" end.
//Command "push constant 1" start.
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 1" end.

//Command "pop that 1" start.
@THAT
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
//Command "pop that 1" end.
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

//Command "push constant 2" start.
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 2" end.

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
(FibonacciSeries__MAIN_LOOP_START)
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
@FibonacciSeries__COMPUTE_ELEMENT
D;JNE
//Command if-goto end.
//Command goto start.
@FibonacciSeries__END_PROGRAM
0;JMP
//Command goto end.
(FibonacciSeries__COMPUTE_ELEMENT)
//Command "push that 0" start.
@THAT
A=M
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push that 0" end.

//Command "push that 1" start.
@1
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
//Command "push that 1" end.

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
//Command "push pointer 1" start.
@4
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push pointer 1" end.

//Command "push constant 1" start.
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 1" end.

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
//Command goto start.
@FibonacciSeries__MAIN_LOOP_START
0;JMP
//Command goto end.
(FibonacciSeries__END_PROGRAM)
