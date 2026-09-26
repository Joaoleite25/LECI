grammar StrLang;

program: stat* EOF;

stat:
      'print' expr    #StatPrint
    | assignment      #StatAssign
    ;

assignment: ID ':' expr
          ;

expr:
      expr '+' expr           #ExprAdd
    | expr '-' expr           #ExprSub
    | 'trim' expr             #ExprTrim
    | 'input' expr            #ExprInput
    | expr '/' expr '/' expr  #ExprSubs
    | '(' expr ')'            #ExprParentesis
    | STRING                  #ExprString
    | ID                      #ExprId
    ;

STRING: '"' ~[\r\n"]* '"';
ID: [a-zA-Z0-9]+;
WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;