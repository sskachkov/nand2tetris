// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/02/Add16.tst

load Add16.hdl,
output-file Add16b.out,
output-list a%B1.16.1 b%B1.16.1 out%B1.16.1;

set a %B1111111111111001,
set b %B0000000000010011,
eval,
output;

