%{
#include<stdio.h>
#include<stdlib.h>
#include "lea.tab.h"
extern YYSTYPE yylval;
int yycol =1,yylineo =1, error_nb =0, tmp;
FILE *yyin;
%}

int (("0x"([0-9]|[A-F])+)|("-"(0|[1-9][0-9]*))|((0|[1-9][0-9]*)))
identifier [a-zA-Z][a-zA-Z0-9]*
character \".*\"
comment1	^(\/\*)(.|\n)*(\*\/)$
comment2	^(\/\/).*$

%%


"'"{idname}"'" {return IDENTIFIER;}




"A FAIRE" {return TOKEN_PROCEDURE;}


"||"					{return TOKEN_OR;}
"&&"					{return TOKEN_AND;}
"<="					{return TOKEN_LE;}
">="					{return TOKEN_GE;}
"!="					{return TOKEN_NE;}
":="					{return TOKEN_AFF;}
".."					{return TOKEN_DOTDOT;}



"integer"				{return TOKEN_INTEGER;}
"AFAIRE"				{return TOKEN_CHARACTER;}
"print"					{return TOKEN_PRINT;}
"null"					{return TOKEN_NULL;}

"BEGIN"		{yycol+=(yyleng+1);return TOKEN_BEGIN;}
"END" 		{yycol+=(yyleng+1);return TOKEN_END;}
"function"		{yycol+=(yyleng+1);return TOKEN_FUNCTION;}
"AFAIRE"		{yycol+=(yyleng+1);return TOKEN_PROCEDURE;}
"if"			{yycol+=(yyleng+1);return TOKEN_IF;}
"then"		{yycol+=(yyleng+1);return TOKEN_THEN;}
"else"		{yycol+=(yyleng+1);return TOKEN_ELSE;}
"while"		{yycol+=(yyleng+1);return TOKEN_WHILE;}
"do"			{yycol+=(yyleng+1);return TOKEN_DO;}
"readln"		{yycol+=(yyleng+1);return TOKEN_READLN;}
"array"		{yycol+=(yyleng+1);return TOKEN_ARRAY;}
"of"			{yycol+=(yyleng+1);return TOKEN_OF;}
"var"			{yycol+=(yyleng+1);return VAR;}
"new"			{yycol+=(yyleng+1);return TOKEN_NEW;}
"dispose"		{yycol+=(yyleng+1);return TOKEN_DISPOSE;}
"println"		{yycol+=(yyleng+1);return TOKEN_PRINTLN;}
"false"		{yycol+=(yyleng+1);return TOKEN_FALSE;}
"true"		{yycol+=(yyleng+1);return TOKEN_TRUE;}
"return"		{yycol+=(yyleng+1);return TOKEN_RETURN;}
"type"		{yycol+=(yyleng+1); return TOKEN_TYPE;}
"character" 	{yycol+=(yyleng+1);return CHARACTER;}
"boolean"		{yycol+=(yyleng+1);return TOKEN_BOOLEAN;}

{integer} {return INTEGER;}

{int}			{yycol+=(yyleng+1);
			tmp=atoi(yytext);
            	if((-32768>tmp)||(tmp>32767)) 
			{error_nb++;
			printf("erreur %d l entier %d  à la position (%d,%d)est trop petit \n",error_nb,tmp,yylineo,ncol);
			}
            	else { return TOKEN_INTEGER;}
			}



{comment1}	{	ncol+=(yyleng+1);++numEL;
                   printf("commentaire multiligne reconnu\n"); 
			yylval.Chaine=strdup(yytext);
          		return comment1;	
		}

{comment2}	{	ncol+=(yyleng+1);++numEL;
                   printf("commentaire monoligne reconnu\n"); 
			yylval.Chaine=strdup(yytext);
          		return comment2;
		}

{identifier}	{yycol+=(yyleng+1); 
			if(strlen(yytext)>30) {error_nb++;
                  printf(" ERREUR LIXICAL %d: l"idf %s est trop long à la position (%d,%d) \n",error_nb,yytext,yylineo,yycol);
							}
                  else{ return IDENTIFIER;}
			}



 
{character}		{yycol+=(yyleng+1);return TOKEN_CHARACTER;}






" "		{yycol++; }
"\t"		{yycol+=2; }
"\n"		{yylineo++;yycol=0; }

.		{ error_nb++; 
		printf("Erreur lexical %d à la position (%d,%d) : %s est une entité non reconnue \n",error_nb,yylineo,ncol,yytext);
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
