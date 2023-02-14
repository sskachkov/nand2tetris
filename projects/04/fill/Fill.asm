// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// screen starting address: 
// 16384
// screen dimensions:
// 256 * 512 = 131072
// 131072 / 16 (word size) = 8192 memory cells
// 16384 + 8192 = 24576
// kb starting address:
// 24576
@R2
@16384
D=A
@scrnAddr
M=D
@24576
D=A
@kbAddr
M=D
@5
D=A
@screenSizeWrds
M=D

(MAIN_LOOP)
@kbAddr
A=M
D=M
@CLEAR_ROUTINE
D;JEQ
@screenSizeWrds
D=M
@cnt
M=D

(COLOR_LOOP)
@cnt
D=M
@MAIN_LOOP
D;JEQ
 
@cnt
D=M
@scrnAddr
A=M
A=A+D

M=-1
@cnt
M=M-1

@COLOR_LOOP
0;JMP

(CLEAR_ROUTINE)
@screenSizeWrds
D=M
@cnt
M=D
(CLEAR_LOOP)
@cnt
D=M
@MAIN_LOOP
D;JEQ

@cnt
D=M
@scrnAddr
A=M
A=A+D

M=0
@cnt
M=M-1

@CLEAR_LOOP
0;JMP



@MAIN_LOOP
D;JEQ
