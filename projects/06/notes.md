var i = 1;
var j = i + 3;
print j;
[
    Token(VAR, 'var', None), 
    Token(IDENTIFIER, 'i', None), 
    Token(EQUAL, '=', None),
    Token(NUMBER, '1', 1.0), 
    Token(SEMICOLON, ';', None), 
     
    Token(VAR, 'var', None), 
    Token(IDENTIFIER, 'j', None), 
    Token(EQUAL, '=', None), 
    Token(IDENTIFIER, 'i', None), 
    Token(PLUS, '+', None), 
    Token(NUMBER, '3', 3.0), 
    Token(SEMICOLON, ';', None), 
    
    Token(PRINT, 'print', None), 
    Token(IDENTIFIER, 'j', None), 
    Token(SEMICOLON, ';', None), 
   
    Token(EOF, '', None)
]
[
    VarDeclStmt(
        Token(IDENTIFIER, 'i', None), 
        Literal(1.0, 1), 
        1
    ), 
    VarDeclStmt(
        Token(IDENTIFIER, 'j', None), 
        Binary(
            VarExpr(Token(IDENTIFIER, 'i', None), 2), 
            Token(PLUS, '+', None), 
            Literal(3.0, 2), 
            2
        ),
        2
    ), 
    PrintStmt(
        VarExpr(
            Token(IDENTIFIER, 'j', None), 
            3
        ),
        3
    )
]


@R2
(LABEL)
D=-D
D=D|M
D=D&M
@LABEL
0;JMP

[
    Token(AT, '@', None), Token(IDENTIFIER, 'R2', None), 
    Token(NEW_LINE, '', None), 

    Token(LEFT_PAREN, '(', None), 
    Token(IDENTIFIER, 'LABEL', None), 
    Token(RIGHT_PAREN, ')', None), 
    Token(NEW_LINE, '', None), 

    Token(IDENTIFIER, 'D', None), 
    Token(EQUAL, '=', None), 
    Token(MINUS, '-', None), 
    Token(IDENTIFIER, 'D', None), 
    Token(NEW_LINE, '', None), 
    
    Token(IDENTIFIER, 'D', None), 
    Token(EQUAL, '=', None), 
    Token(IDENTIFIER, 'D', None), 
    Token(OR, '|', None), 
    Token(IDENTIFIER, 'M', None), Token(NEW_LINE, '', None), 

    Token(IDENTIFIER, 'D', None), 
    Token(EQUAL, '=', None), 
    Token(IDENTIFIER, 'D', None), 
    Token(AND, '&', None), 
    Token(IDENTIFIER, 'M', None), Token(NEW_LINE, '', None), 
    
    Token(AT, '@', None), 
    Token(IDENTIFIER, 'LABEL', None), 
    Token(NEW_LINE, '', None), 
    
    Token(NUMBER, '0', 0), 
    Token(SEMICOLON, ';', None), 
    Token(IDENTIFIER, 'JMP', None), 
    Token(NEW_LINE, '', None), 
    
    Token(EOF, '', None)
]