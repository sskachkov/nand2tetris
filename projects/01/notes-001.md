And.hdl - done
And16.hdl - Done
DMux.hdl - done
DMux4Way.hdl - done
DMux8Way.hdl - done
Mux.hdl - done
Mux16.hdl - done
Mux4Way16.hdl - done
Mux8Way16.hdl - done
Not.hdl - done
Not16.hdl - done
Or.hdl - done
Or16.hdl - done
Or8Way.hdl - done
Xor.hdl - done

nand
x | y | o
---------
0 | 0 | 1
0 | 1 | 1
1 | 0 | 1
1 | 1 | 0

not
x | o
---------
0 | 1
1 | 0
nand(x, x)

and
x | y | o
---------
0 | 0 | 0
0 | 1 | 0
1 | 0 | 0
1 | 1 | 1 
not(nand(x, y))
nand(nand(x, y), nand(x, y))

or
x | y | o
---------
0 | 0 | 0
0 | 1 | 1
1 | 0 | 1
1 | 1 | 1
nand(not x, not y)
nand(nand(x, x), nand(y, y))

xor
x | y | o
---------
0 | 0 | 0
0 | 1 | 1
1 | 0 | 1
1 | 1 | 0
((not x) and y) or (x and (not y))
(y and not x) or (x and not y)
or(and(y, not(x)), and(x, not (y)))

not x and not y
x | y | o
---------
0 | 0 | 1
0 | 1 | 0
1 | 0 | 0
1 | 1 | 0

x and (not y)
x | y | o
---------
0 | 0 | 0
0 | 1 | 0
1 | 0 | 1
1 | 1 | 0

(not x) and y
x | y | o
---------
0 | 0 | 0
0 | 1 | 1
1 | 0 | 0
1 | 1 | 0
