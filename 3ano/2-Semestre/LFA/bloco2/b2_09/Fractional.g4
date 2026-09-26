grammar Fractional;

program: stat* EOF;

stat: expr ';'                       #StatExpr
    | 'print' expr ';'               #StatPrint
    | expr '->' ID ';'               #StatAssign
    ;

expr: '(' expr ')'                   #ExprParent
    | op=('+'|'-') expr              #ExprUnary
    | <assoc=right> expr '^' expr    #ExprPower
    | expr op=('*'|':') expr         #ExprMulDiv
    | expr op=('+'|'-') expr         #ExprAddSub
    | 'reduce' expr                  #ExprReduce
    | 'read' String                  #ExprRead
    | ID                             #ExprId
    | fraction                       #ExprFraction
    ;

fraction: (sign='-')? num=Integer ('/' den=Integer)? ;

Integer: [0-9]+;
ID: [a-zA-Z]+;
String: '"' (~["])* '"';
WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\n]* -> skip;