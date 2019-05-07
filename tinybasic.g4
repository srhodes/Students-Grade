//srhodes17@georgefox.edu
//Assignment 2
//2019-2-13

grammar tinybasic; 
 

// can have as many line as we want
prog: (line)* ;


// could or could not have numbers in new line
line : number ' ' statement NEWLINE | statement NEWLINE ;
 
// statement allowed by tiny basic 

statement : 'PRINT ' exprlist 
          | 'IF ' expression relop expression ' THEN ' statement
          | 'GOTO ' expression
          | 'INPUT ' varlist
          | 'LET ' VAR '=' expression
          | 'GOSUB' expression
          | 'RETURN '
          | 'CLEAR'
          | 'LIST'
          | 'RUN'
          | 'END' ;
 
// we can have comma within the statement like in print for example 

exprlist : (STRING|expression) (', ' (STRING|expression) )* ;
 
// list out variable separate out with a comma

varlist : VAR (', ' VAR)* ;

// deal with the order of operation, sum, substraction
 
expression : ('+'|'-') term (('+'|'-') term)* | term (('+'|'-') term)* ;

// multiplication and division begin first before the term
 
term : factor (('*'|'/') factor)* ;

// variables or numbers or expression that are calculated together
 
factor : VAR | number | '(' expression ')' ;

// any uppercase letters from A to Z 
 
VAR : ('A'..'Z') ;		

// any numbers made up of digit
 
number : DIGIT DIGIT* ;

// just digits
 
DIGIT : ('0'..'9') ;
 
// all of the math symbols used

relop : '<' ('>'|'=') | '>' ('<'|'=') | '=' | '<' | '>' ;

// Strings of characters and digits 

STRING : '"' (('a'..'z')|('A'..'Z')|DIGIT|' '|'?'|'!')* '"' ;

// character of newline

NEWLINE : [\r\n]+ ;	
