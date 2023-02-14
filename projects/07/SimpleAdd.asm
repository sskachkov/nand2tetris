//push constant 7 command start
@7
D=M
@SP
A=M
M=D
@SP
M=M+1
//push constant 7 command end

//push constant 8 command start
@8
D=M
@SP
A=M
M=D
@SP
M=M+1
//push constant 8 command end

//arithmetic command add start
@sp
A=M
D=M
@sp
M=M-1
A=M
A=M
D=D+A
@sp
M=M-1
A=M
M=D
@sp
M=M+1
//arithmetic command add end

