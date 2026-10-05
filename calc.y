%{

#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);

%}

%token NUM

%left '+' '-'
%left '*' '/'
%%

input : expr { printf("Result = %d\n", $1); };

expr : expr '+' expr { $$ = $1 + $3; }
| expr '-' expr { $$ = $1 - $3; }
| expr '*' expr { $$ = $1 * $3; }
| expr '/' expr { $$ = $1 / $3; }
| '(' expr ')' { $$ = $2; }
| NUM { $$ = $1; }
;

%%

int main()
{
printf("Enter Expression: ");
yyparse();
return 0;
}
void yyerror(char *s)
{
printf("Invalid Expression\n");
}
