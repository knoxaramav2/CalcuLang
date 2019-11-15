grammar macro;

program returns [Program ast]:
    e=exp {}
    ;

exp  returns [Exp ast]:
    n=numexp {}
    ;

numexp returns [NumExp ast]:
      n0 = WHOLE  {$ast = new NumExp(Integer.parseInt($n0.text));}
    | '-' n0 = WHOLE {$ast = new NumExp(-Integer.parseInt($n0.text));}
    | n0 = DECIMAL {$ast = new NumExp(Double.parseDouble($n0.text));}
    | '-' n0 = DECIMAL {$ast = new NumExp(-Double.parseDouble($n0.text));}
    ;

WHOLE       :INTEGER ;
DECIMAL     : INTEGER('.'INTEGER);

fragment INTEGER : NUMBER+;
fragment NUMBER      : ('0'..'9');

//Scoping
L_PARAN     : '(';
R_PARAN     : ')';

//Representations
FRACTION    : '|';

//Core functions
SIG_SUM     : 'SIG';
PI_PROD     : 'PROD';
INTEGRAL    : 'I' | 'i';
DERIVE      : 'D' | 'd';

//Basic operations
OP_L3       : '^' | 'sqrt';
OP_L2       : '*' | '/';
OP_L1       : '+' | '-';

//Ignores
 WS  :  [ \t\r\n\u000C]+ -> skip;
 Comment :   '#*' .*? '*#' -> skip;
 Line_Comment :   '#' ~[\r\n]* -> skip;