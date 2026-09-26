grammar Numbers;

// --- Regras de Parser (minúsculas) ---
file: line+ EOF;

line: NUM '-' NAME NEWLINE;

// --- Regras de Lexer (MAIÚSCULAS) ---
NUM:  [0-9]+ ;
NAME: [a-zA-Z]+ ;

NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip;