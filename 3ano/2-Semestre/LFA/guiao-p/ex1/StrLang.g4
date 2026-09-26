grammar StrLang;

program: ent* EOF ;

ent:    'print' expr            # Print
        | ID ':' expr           # Assign
        ;

expr:   String                  # String
        | ID                    # Id
        | 'input' expr          # Input
        | expr '+' expr         # Add
        | expr '-' expr         # Sub
        | 'trim' expr           # Trim
        | expr '/' expr '/' expr         # Subst
        | '(' expr ')'          # Parent
        ;

ID: [a-zA-Z][a-zA-Z0-9]* ;
String: '"' .*? '"' ;

COMMENT: '//' ~[\r\n]* -> skip;
WS: [ \t\r\n]+ -> skip ;