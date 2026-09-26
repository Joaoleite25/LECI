grammar FracLang;

program: stat* EOF;

stat:   'display' expr ';'?      # Display
        | ID '<=' expr ';'?       # MenIgual
        ;

expr:   '(' expr ')'             # Parent
        | '-' expr               # Negativo
        | 'reduce' expr          # Reduce 
        | 'read' String          # Read
        | expr '*' expr          # Mult
        | expr '/' expr          # Div
        | expr ':' expr          # Div
        | expr '+' expr          # Soma
        | expr '-' expr          # Sub
        | Number                 # Number
        | ID                     # ID
        ;

Number: [0-9]+ ;
ID: [a-zA-Z][a-zA-Z0-9]*;
String: '"' .*? '"' ;

COMMENT: '--' ~[\r\n]* -> skip ;
WS: [ \t\r\n]+ -> skip;