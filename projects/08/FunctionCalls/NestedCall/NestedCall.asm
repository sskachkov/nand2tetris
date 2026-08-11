//Function header Sys.init start.
(Sys.init)
//Function header Sys.init end.
//Command "push constant 4000" start.
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 4000" end.

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
//Command "push constant 5000" start.
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 5000" end.

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
//call to Sys.main start.
//Command "push constant Sys_Sys.init_0" start.
@Sys_Sys.init_0
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant Sys_Sys.init_0" end.

//Command "push value of LCL start.
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of LCL end.
//Command "push value of ARG start.
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of ARG end.
//Command "push value of THIS start.
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of THIS end.
//Command "push value of THAT start.
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of THAT end.
//move ARG
@SP
D=M
@5
D=D-A
@ARG
M=D
//move LCL
@SP
D=M
@LCL
M=D
//func call and return label
@Sys.main
0;JMP
(Sys_Sys.init_0)
//call to Sys.main end.
//Command "pop temp 1" start.
@6
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
//Command "pop temp 1" end.
(Sys_Sys.init_LOOP)
//Command goto start.
@Sys_Sys.init_LOOP
0;JMP
//Command goto end.
//Function header Sys.main start.
(Sys.main)
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

//Command "push constant 0" start.
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 0" end.

//Function header Sys.main end.
//Command "push constant 4001" start.
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 4001" end.

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
//Command "push constant 5001" start.
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 5001" end.

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
//Command "push constant 200" start.
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 200" end.

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
//Command "push constant 40" start.
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 40" end.

//Command "pop local 2" start.
@LCL
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
//Command "pop local 2" end.
//Command "push constant 6" start.
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 6" end.

//Command "pop local 3" start.
@LCL
D=M
@3
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
//Command "pop local 3" end.
//Command "push constant 123" start.
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 123" end.

//call to Sys.add12 start.
//Command "push constant Sys_Sys.main_1" start.
@Sys_Sys.main_1
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant Sys_Sys.main_1" end.

//Command "push value of LCL start.
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of LCL end.
//Command "push value of ARG start.
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of ARG end.
//Command "push value of THIS start.
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of THIS end.
//Command "push value of THAT start.
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//Command "push value of THAT end.
//move ARG
@SP
D=M
@6
D=D-A
@ARG
M=D
//move LCL
@SP
D=M
@LCL
M=D
//func call and return label
@Sys.add12
0;JMP
(Sys_Sys.main_1)
//call to Sys.add12 end.
//Command "pop temp 0" start.
@5
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
//Command "pop temp 0" end.
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

//Command "push local 2" start.
@2
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
//Command "push local 2" end.

//Command "push local 3" start.
@3
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
//Command "push local 3" end.

//Command "push local 4" start.
@4
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
//Command "push local 4" end.

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
//Function header Sys.add12 start.
(Sys.add12)
//Function header Sys.add12 end.
//Command "push constant 4002" start.
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 4002" end.

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
//Command "push constant 5002" start.
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 5002" end.

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

//Command "push constant 12" start.
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 12" end.

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
