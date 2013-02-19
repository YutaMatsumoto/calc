%token PLUS 
%token MINUS 
%token MULT 
%token DIV 
%token INTEGER 
%token SEMI 
%token OPEN 
%token CLOSE 
%token ERROR 

%{
#include <stdio.h>
typedef int YYSTYPE;
%}

%start start

%% 

start 
	:	start expr SEMI {
			printf("%d\n",$2);
		}
	|	expr SEMI { 
			printf("%d\n",$1);
		}
		

expr 
	:	expr PLUS term {
			$$ = $1 + $3;		
		}
	|	expr MINUS term {
			$$ = $1 - $3;		
		}
	|	term {
			$$ = $1;
		}

term 
	:	term MULT factor {
			$$ = $1 * $3; 
		}
	|	term DIV factor {
			$$ = $1 / $3;
		}
	|	factor {
			$$  = $1;
		}
	
factor
	:	INTEGER { 
			$$ = $1;
		}
	|	OPEN expr CLOSE {
			$$ = $2;
		}
		


%%

main()
{
	yyparse();
}

yyerror(char* msg) 
{
	printf("%s\n", msg);
}
