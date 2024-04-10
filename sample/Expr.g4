// Arthur Carvalho, Gabriel Gomes Fachineli e Guilherme Zanchettin

grammar Expr;

// Token definitions

POSITIVE_INT : [1-9] [0-9]* ; 
NEGATIVE_INT : '-' [1-9] [0-9]* ;
POSITIVE_FLOAT : [1-9] [0-9]* ('.' [0-9]+)? | NUMBER_ZERO '.' [0-9]+ ;
NEGATIVE_FLOAT : '-' [1-9] [0-9]* ('.' [0-9]+)? | '-' NUMBER_ZERO '.' [0-9]+ ;
NUMBER_ZERO : [0] ;
LINE_BREAK : ('\r'? '\n' | '\r')+ ; // Line break
WS: [ \t]+ -> skip ; // This token is used to ignore white spaces and tabs	

// Program execution

program: line_expression+ ; // The program is composed of one or more expressions

line_expression: expr LINE_BREAK ; // An expression followed by a line break

// Expression rules

expr:  
       '(' expr expr operator ')'
     | '(' expr expr operator expr ')'
     | '(' expr expr operator expr operator ')'
     | '(' expr positive_integer_number operator ')'
     | '(' integer_number non_zero_integer_number '/'  ')'
     | '(' integer_number non_zero_integer_number '|' ')'
     | '(' integer_number non_zero_float_number '|' ')'
     | '(' float_number non_zero_integer_number '|' ')'
     | '(' float_number non_zero_float_number '|' ')'
     | '(' integer_number non_zero_integer_number '%' ')'
     | '(' real_number positive_integer_number '^' ')'
     | '(' real_number real_number '+' ')'
     | '(' real_number real_number '-' ')'
     | '(' real_number real_number '*' ')'
     | '(' real_number expr  operator ')'
     | '(' real_number 'MEM' ')'
     | '(' 'MEM' ')'
     | '(' expr 'MEM' ')'
     | '(' 'MEM' expr ')'
     | '(' 'MEM' expr operator ')'
     | '(' real_number 'MEM' expr operator ')'
     | '(' positive_integer_number 'RES' ')'
     | '(' positive_integer_number 'RES' expr operator ')'
     | '(' expr positive_integer_number 'RES' ')'
     | '(' expr 'RES'  ')'
     | '(' expr 'RES' expr  ')'
     | '(' expr 'RES' expr operator  ')'
     | '(' expr 'RES' expr 'RES' operator  ')'
     ;

// Additional expression rules

operator : '+' | '-' | '*' | '/' | '%' | '^' | '|' ;

real_number: integer_number | float_number ;

non_zero_integer_number : POSITIVE_INT | NEGATIVE_INT ;
non_zero_float_number : POSITIVE_FLOAT | NEGATIVE_FLOAT ;

integer_number: non_zero_integer_number | zero_number ;
float_number: non_zero_float_number | zero_number ;
zero_number : NUMBER_ZERO ;

positive_integer_number: POSITIVE_INT ;
negative_integer_number: NEGATIVE_INT ;
positive_float_number: POSITIVE_FLOAT ;
negative_float_number: NEGATIVE_FLOAT ;