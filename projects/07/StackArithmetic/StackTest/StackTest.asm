//Command "push constant 17" start.
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 17" end.

//Command "push constant 17" start.
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 17" end.

//Command "eq" #0 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_0
D;JEQ
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_0
0;JMP
(L_CMP_SUCCESS_0)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_0)
//Command "eq" #0 end.

//Command "push constant 17" start.
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 17" end.

//Command "push constant 16" start.
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 16" end.

//Command "eq" #1 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_1
D;JEQ
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_1
0;JMP
(L_CMP_SUCCESS_1)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_1)
//Command "eq" #1 end.

//Command "push constant 16" start.
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 16" end.

//Command "push constant 17" start.
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 17" end.

//Command "eq" #2 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_2
D;JEQ
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_2
0;JMP
(L_CMP_SUCCESS_2)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_2)
//Command "eq" #2 end.

//Command "push constant 892" start.
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 892" end.

//Command "push constant 891" start.
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 891" end.

//Command "lt" #3 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_3
D;JGT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_3
0;JMP
(L_CMP_SUCCESS_3)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_3)
//Command "lt" #3 end.

//Command "push constant 891" start.
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 891" end.

//Command "push constant 892" start.
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 892" end.

//Command "lt" #4 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_4
D;JGT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_4
0;JMP
(L_CMP_SUCCESS_4)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_4)
//Command "lt" #4 end.

//Command "push constant 891" start.
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 891" end.

//Command "push constant 891" start.
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 891" end.

//Command "lt" #5 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_5
D;JGT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_5
0;JMP
(L_CMP_SUCCESS_5)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_5)
//Command "lt" #5 end.

//Command "push constant 32767" start.
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32767" end.

//Command "push constant 32766" start.
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32766" end.

//Command "gt" #6 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_6
D;JLT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_6
0;JMP
(L_CMP_SUCCESS_6)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_6)
//Command "gt" #6 end.

//Command "push constant 32766" start.
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32766" end.

//Command "push constant 32767" start.
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32767" end.

//Command "gt" #7 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_7
D;JLT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_7
0;JMP
(L_CMP_SUCCESS_7)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_7)
//Command "gt" #7 end.

//Command "push constant 32766" start.
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32766" end.

//Command "push constant 32766" start.
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 32766" end.

//Command "gt" #8 start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D-A
@L_CMP_SUCCESS_8
D;JLT
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@L_CMP_END_8
0;JMP
(L_CMP_SUCCESS_8)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_CMP_END_8)
//Command "gt" #8 end.

//Command "push constant 57" start.
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 57" end.

//Command "push constant 31" start.
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 31" end.

//Command "push constant 53" start.
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 53" end.

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

//Command "push constant 112" start.
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 112" end.

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

//Command "neg" start.
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
//Command "neg" end.

//Command "and" start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D&A
@SP
A=M
M=D
@SP
M=M+1
//Command "and" end.

//Command "push constant 82" start.
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
//Command "push constant 82" end.

//Command "or" start.
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
A=M
D=D|A
@SP
A=M
M=D
@SP
M=M+1
//Command "or" end.

//Command "not" start.
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
//Command "not" end.

