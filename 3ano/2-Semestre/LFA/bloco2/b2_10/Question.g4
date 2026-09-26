grammar Question;

program : (question | COMMENT)* EOF ;
question : id '(' text ')' '{' answer+ '}' ;
answer : text ':' score ';' ;
id : ID_PART ('.' ID_PART)* ;
text : STRING ;
score : INT ;

// --- LEXER ---
STRING  : '"' (~'"')* '"' ; // Lê tudo entre aspas, incluindo enters
INT     : [0-9]+ ;
ID_PART : [a-zA-Z] [a-zA-Z0-9]* ; // Garante que IDs começam com letra
COMMENT : '#' ~[\r\n]* -> skip ;
WS      : [ \t\r\n]+ -> skip ;