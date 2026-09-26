grammar SetCalc;

program : (stat | COMMENT)* EOF ;

stat : expr                             #statExpr
     | VAR '=' expr                     #statAssign
     ;

expr : '(' expr ')'                     #exprParenthesis
     | expr '+' expr                    #exprUnion
     | expr '&' expr                    #exprIntersection
     | expr '\\' expr                   #exprDifference
     | set                              #exprSet
     | VAR                              #exprVar
     ;

set  : '{' (element (',' element)*)? '}' ;

element : WORD | NUMBER ;

// Lexer
VAR    : [A-Z]+ ;
WORD   : [a-z]+ ;
NUMBER : [+-]? [0-9]+ ;
COMMENT: '--' ~[\r\n]* -> skip ;
WS     : [ \t\r\n]+ -> skip ;