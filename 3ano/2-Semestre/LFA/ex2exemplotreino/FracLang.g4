grammar FracLang;

program: stat* EOF ;

stat: 'display' expr ';'
    | ID '<=' expr ';'
    ;

expr: 'read' STRING                 #ExprRead
    | '(' expr ')'                  #ExprParens
    | op=('+' | '-') expr           #ExprUnary
    | expr op=('*' | ':') expr      #ExprMultDiv
    | expr op=('+' | '-') expr      #ExprAddSub
    | 'reduce' expr                 #ExprReduce
    | NUMBER '/' NUMBER             #ExprFraction
    | NUMBER                        #ExprInteger
    | ID                            #ExprId
    ;

ID: [a-z]+ ;
NUMBER: [0-9]+ ;
STRING: '"' .*? '"' ;
WS: [ \t\r\n]+ -> skip ;
COMMENT: '--' ~[\r\n]* -> skip ;