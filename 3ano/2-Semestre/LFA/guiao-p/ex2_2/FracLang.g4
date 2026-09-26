grammar FracLang;

program: stat* EOF;

stat:   'display' expr ';'        # Display
        | ID '<=' expr ';'         # Guarda
    ;

expr:   op=('+' | '-') expr           # PosNeg
        | e1=expr op=('*' | ':') e2=expr    # MulDiv
        | e1=expr op=('+' | '-') e2=expr    # SomSub
        | '(' expr ')'                # Parent
        | 'reduce' expr               # Reduce
        | 'read' String             # Read
        | Fraction                # Fraction
        | ID                    # ID
        | String                # String
        ;

ID: [a-z]+;
Fraction: [0-9]+ ('/' [0-9]+)?; 
String: '"' .*? '"';

COMMENT: '--' ~[\r\n]* -> skip;
WS: [ \t\r\n]+ -> skip;