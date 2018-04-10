%{
#include<stdio.h>
#include<stdlib.h>
#include "lea.tab.h"
extern YYSTYPE yylval;
int yycol =1,yylineo =1, error_nb =0, tmp;
FILE *yyin;
%}

integer (("0x"([0-9]|[A-F])+)|("-"(0|[1-9][0-9]*))|((0|[1-9][0-9]*)))
identifier [a-zA-Z][a-zA-Z0-9]*
char [a-zA-Z\d]
comment1	^(\/\*)(.|\n)*(\*\/)$
comment2	^(\/\/).*$

%%


"'"{char}"'" 	{yycol+=(yyleng+1);return CHARACTER;}
{identifier}	{yycol+=(yyleng+1);return IDENTIFIER;}
{integer}		{yycol+=(yyleng+1);return INTEGER;}
"procedure"		{yycol+=(yyleng+1);return TOKEN_PROCEDURE;}
":="			{yycol+=(yyleng+1);return TOKEN_AFF;}
"&&"			{yycol+=(yyleng+1);return TOKEN_AND;}
"character"		{yycol+=(yyleng+1);return TOKEN_CHARACTER;}
".."			{yycol+=(yyleng+1);return TOKEN_DOTDOT;}
"<="			{yycol+=(yyleng+1);return TOKEN_LE;}
">="			{yycol+=(yyleng+1);return TOKEN_GE;}
"!="			{yycol+=(yyleng+1);return TOKEN_NE;}
"null"			{yycol+=(yyleng+1);return TOKEN_NULL;}
"print"			{yycol+=(yyleng+1);return TOKEN_PRINT;}
"||"			{yycol+=(yyleng+1);return TOKEN_OR;}
"integer"		{yycol+=(yyleng+1);return TOKEN_INTEGER;}

"BEGIN"			{yycol+=(yyleng+1);return TOKEN_BEGIN;}
"END" 			{yycol+=(yyleng+1);return TOKEN_END;}
"function"		{yycol+=(yyleng+1);return TOKEN_FUNCTION;}
"if"			{yycol+=(yyleng+1);return TOKEN_IF;}
"then"			{yycol+=(yyleng+1);return TOKEN_THEN;}
"else"			{yycol+=(yyleng+1);return TOKEN_ELSE;}
"while"			{yycol+=(yyleng+1);return TOKEN_WHILE;}
"do"			{yycol+=(yyleng+1);return TOKEN_DO;}
"readln"		{yycol+=(yyleng+1);return TOKEN_READLN;}
"array"			{yycol+=(yyleng+1);return TOKEN_ARRAY;}
"of"			{yycol+=(yyleng+1);return TOKEN_OF;}
"var"			{yycol+=(yyleng+1);return TOKEN_VAR;}
"new"			{yycol+=(yyleng+1);return TOKEN_NEW;}
"dispose"		{yycol+=(yyleng+1);return TOKEN_DISPOSE;}
"println"		{yycol+=(yyleng+1);return TOKEN_PRINTLN;}
"false"			{yycol+=(yyleng+1);return TOKEN_FALSE;}
"true"			{yycol+=(yyleng+1);return TOKEN_TRUE;}
"return"		{yycol+=(yyleng+1);return TOKEN_RETURN;}
"type"			{yycol+=(yyleng+1);return TOKEN_TYPE;}
"boolean"		{yycol+=(yyleng+1);return TOKEN_BOOLEAN;}

{integer}		{yycol+=(yyleng+1);
					tmp=atoi(yytext);
            		if((-32768>tmp)||(tmp>32767)){
            			error_nb++;
						printf("Error n.%d : the integer \"%d\"  at (%d,%d) is too small.\n",error_nb, tmp, yylineo, ncol);
					} else return INTEGER; 
				}



{comment1}		{	ncol+=(yyleng+1);++numEL;
                	printf("Multi-line commentary accepted.\n"); 
					yylval.Chaine=strdup(yytext);
          			return comment1;/*what's comment1 ?*/
				}

{comment2}		{	ncol+=(yyleng+1);++numEL;
                	printf("Mono-line commentary accepted.\n"); 
					yylval.Chaine=strdup(yytext);
          			return comment2;/*??? same*/
				}

{identifier}	{	yycol+=(yyleng+1); 
					if(strlen(yytext)>30){
						error_nb++;
                  		printf(" LEXICAL ERROR %d: the identifier \"%s\" at (%d,%d) is too long.\n",error_nb ,yytext, yylineo, yycol);
					} else return IDENTIFIER;
			}





" "		{yycol++; }
"\t"		{yycol+=2; }
"\n"		{yylineo++;yycol=0; }

.		{ error_nb++; 
		printf("Erreur lexicale %d à la position (%d,%d) : %s est une entité non reconnue \n",error_nb,yylineo,ncol,yytext);
		}

%%

int yywrap(void){
  return 0;

}

int main(int argc, char *argv[])
{

yyin=fopen(argv[1],"r");
yylex();
fclose(yyin);

}
