%{
#include <stdlib.h>
#include "calc.tab.h"
%}

/* Definition */
delim   [ \t\n]
ws  {delim}+
digithead [1-9]
digittail [0-9]
number  {digit}+
/* defined in calc.tab.h */
plus    "+"
minus   "-"
mult    "*"
div     "/"
integer {digithead}{digittail}*
semi    ";"
open    "("
close   ")"

%% 

{plus}      { return PLUS; }
{minus}     { return MINUS; }
{mult}      { return MULT; }
{div}       { return DIV; }
{integer}   { install_integer() ; return INTEGER; }
{semi}      { return SEMI; }
{open}      { return OPEN; }
{close}     { return CLOSE; }
.           { return ERROR; }

%% 
install_integer() 
{
	yylval = atoi(yytext); 
	/* printf("number found: %d\n", yylval); */ 
}
