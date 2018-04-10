%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<limits.h>
	#include "lea.init.tab.h"
	extern YYSTYPE yylval;

	int column = 1;
	int line = 1;
	int error_nb = 0;
	int tmp;
	FILE *yyin;
%}

integer 	(("0x"([0-9]|[A-F])+)|("-"(0|[1-9][0-9]*))|((0|[1-9][0-9]*)))
operator	"!"|"("|")"|"*"|"+"|","|":"|"/"|"-"|";"|"<"|">"|"="|"["|"]"|"^"
identifier 	[a-zA-Z][a-zA-Z0-9]*
character 	"'"[a-zA-Z]"'"
comment2	^(\/\/).*$

%x MULTI_COMMENT MONO_COMMENT

%%
"/*"				{BEGIN(MULTI_COMMENT);}
<MULTI_COMMENT>"*/"	{	column+=(yyleng+1);
						/*++numEL;*/
                		printf("Multi-line commentary accepted.\n"); 
						/*yylval.Chaine=strdup(yytext);*/
          				return 0;
          			}
<MULTI_COMMENT>\n 	{;}
<MULTI_COMMENT>.	{;}



{character}	 	{column+=(yyleng+1);return CHARACTER;}
"procedure"		{column+=(yyleng+1);return TOKEN_PROCEDURE;}
":="			{column+=(yyleng+1);return TOKEN_AFF;}
"&&"			{column+=(yyleng+1);return TOKEN_AND;}
"character"		{column+=(yyleng+1);return TOKEN_CHARACTER;}
".."			{column+=(yyleng+1);return TOKEN_DOTDOT;}
"<="			{column+=(yyleng+1);return TOKEN_LE;}
">="			{column+=(yyleng+1);return TOKEN_GE;}
"!="			{column+=(yyleng+1);return TOKEN_NE;}
"null"			{column+=(yyleng+1);return TOKEN_NULL;}
"print"			{column+=(yyleng+1);return TOKEN_PRINT;}
"||"			{column+=(yyleng+1);return TOKEN_OR;}
"integer"		{column+=(yyleng+1);return TOKEN_INTEGER;}
"BEGIN"			{column+=(yyleng+1);return TOKEN_BEGIN;}
"END" 			{column+=(yyleng+1);return TOKEN_END;}
"function"		{column+=(yyleng+1);return TOKEN_FUNCTION;}
"if"			{column+=(yyleng+1);return TOKEN_IF;}
"then"			{column+=(yyleng+1);return TOKEN_THEN;}
"else"			{column+=(yyleng+1);return TOKEN_ELSE;}
"while"			{column+=(yyleng+1);return TOKEN_WHILE;}
"do"			{column+=(yyleng+1);return TOKEN_DO;}
"array"			{column+=(yyleng+1);return TOKEN_ARRAY;}
"of"			{column+=(yyleng+1);return TOKEN_OF;}
"var"			{column+=(yyleng+1);return TOKEN_VAR;}
"new"			{column+=(yyleng+1);return TOKEN_NEW;}
"dispose"		{column+=(yyleng+1);return TOKEN_DISPOSE;}
"println"		{column+=(yyleng+1);return TOKEN_PRINTLN;}
"false"			{column+=(yyleng+1);return TOKEN_FALSE;}
"true"			{column+=(yyleng+1);return TOKEN_TRUE;}
"return"		{column+=(yyleng+1);return TOKEN_RETURN;}
"type"			{column+=(yyleng+1);return TOKEN_TYPE;}
"boolean"		{column+=(yyleng+1);return TOKEN_BOOLEAN;}


{integer}		{column+=(yyleng);
					tmp=atoi(yytext);
            		if((tmp<INT_MIN)||(INT_MAX<tmp)){
            			error_nb++;
						fprintf(stderr, "Error n.%d : the integer \"%d\"  at l:%d, c:%d is either too small or too big (%d, %d).\n",error_nb, tmp, line, column-yyleng, INT_MIN, INT_MAX);
					} else return INTEGER; 
				}

{comment2}		{	column+=(yyleng+1);
					/*++numEL;*/
                	printf("Mono-line commentary accepted.\n"); 
					/*yylval.Chaine=strdup(yytext);*/
          			return 0;
				}

{identifier}	{	column+=(yyleng+1); 
					if(strlen(yytext)>30){
						error_nb++;
                  		fprintf(stderr, "LEXICAL ERROR %d: the identifier \"%s\" at l:%d, c:%d is too long.\n", error_nb ,yytext, line, column-yyleng+1);
					} else return IDENTIFIER;
				}





{operator}		{column++;}
" "				{column++; }
"\t"			{column++; }
"\n"			{line++; column=1;}


.				{	error_nb++; 
					fprintf(stderr, "Lexical error n.%d at l:%d, c:%d : \"%s\" unknown. \n", error_nb, line, column-yyleng+1, yytext);
				}

%%

int yywrap(void){
  return 0;
}

/*int main(int argc, char *argv[]){
	yyin = fopen(argv[1],"r");
	yylex();
	fclose(yyin);
}*/
