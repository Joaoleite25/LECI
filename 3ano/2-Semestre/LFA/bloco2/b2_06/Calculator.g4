grammar Calculator;

program: stat* EOF;

stat: expr? NEWLINE        #StatExpr
    | assignment NEWLINE   #StatAssign
    ;

assignment: ID '=' expr ;

expr: expr op=('*'|'/'|'%') expr     #ExprMultDivMod
    | expr op=('+'|'-') expr         #ExprAddSub
    | Integer                        #ExprInteger
    | ID                             #ExprId
    | '(' expr ')'                   #ExprParent
    ;

ID: [a-zA-Z]+ ;
Integer: [0-9]+ ;
NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip;