//set RAM[0] 256,   // stack pointer
@256
D=A
@0
M=D
//set RAM[1] 300,   // base address of the local segment
@300
D=A
@1
M=D
//set RAM[2] 400,   // base address of the argument segment
@400
D=A
@2
M=D
//set RAM[3] 3000,  // base address of the this segment
@3000
D=A
@3
M=D
//set RAM[4] 3010,  // base address of the that segment
@3010
D=A
@4
M=D

//push const 21 into stack
@21
D=A
@SP
A=M
M=D
@SP
M=M+1

//push const 23 into stack
@23
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop stack into lcl 3
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




