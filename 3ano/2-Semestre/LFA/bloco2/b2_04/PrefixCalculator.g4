grammar PrefixCalculator;

program: stat* EOF;

stat: expr? NEWLINE;

expr: op=('*'|'/'|'%'|'+'|'-') expr expr   # ExprBinary
    | op=('+'|'-') expr                   # ExprUnary
    | Integer                             # ExprInteger
    | '(' expr ')'                        # ExprParent
    ;

Integer: [0-9]+;
NEWLINE: '\r'? '\n';
WS: [ \t]+ -> skip;