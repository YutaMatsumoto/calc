#include <stdio.h>
#include "calc.tab.h"

int yylval = 0;

main(){
	extern 	char 	yytext[];
	int	token;

	printf("Performing Lexical Analysis\n");

	while((token=yylex()) != 0){
		switch(token){
			case PLUS    : printf("Found PLUS   \n") ; break;
			case MINUS   : printf("Found MINUS  \n") ; break;
			case MULT    : printf("Found MULT   \n") ; break;
			case DIV     : printf("Found DIV    \n") ; break;
			case INTEGER : printf("Found INTEGER %d\n", yylval ) ; break;
			case SEMI    : printf("Found SEMI   \n") ; break;
			case OPEN    : printf("Found OPEN   \n") ; break;
			case CLOSE   : printf("Found CLOSE  \n") ; break;
			case ERROR   : printf("Found ERROR  \n") ; break;
		}
	}
	
	printf("Lexical Analysis Complete\n");
}
