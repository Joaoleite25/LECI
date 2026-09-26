grammar Hello ; 

options { caseInsensitive = true; }
// Regra principal: aceita qualquer uma das opções repetidamente
program : (stat)* EOF ;

stat : greetings 
     | bye 
     ;

greetings : 'hello' ID ;
bye       : 'bye' ID ;

ID : [a-z]+ ;
WS : [ \t\r\n]+ -> skip ;