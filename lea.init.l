%{
#include "lea.init.tab.h"
%}



%option nounput noinput
%%


"+"		{return PLUS;}
"-" 	{return LESS;}
"*"		{return MULT;}
"/"		{return DIV; }
"||"	{return OR;}
"&&"	{return AND;}
[^0-9]"-"[0-9]+	{return NEG;}
"!"		{return NOT;}
"<"(^=)	{return ST;}
"<="	{return SET;}
">"(^=)	{return GT;}
">="	{return GET;}
":="	{return AFF;}
(^!)(^<)(^>)"="	{return EQ;}
"!="	{return NOTEQ;}
"("		{return LP;}
")"		{return RP;}
":"(^=)	{return COL;}
";"		{return SEQ;}
"["		{return LB;}
"]"		{return RB;}
".."	{return DD;}
"function"	{return FUN;}
"boolean"	{return BOOL;}
"integer"	{return INT;}
"begin"		{return BEGIN;}
"end"		{return END;}
"return"	{return RET;}
"array"		{return ARR;}
"of"		{return OF;}
"if"		{return IF;}
"then"		{return THEN;}
"else"		{return ELSE;}
"do"		{return DO;}
"while"		{return WHILE;}
"^"			{return PTR;}
"var"		{return VAR;}
"new"		
"null"
"dispose"
"'"
"println"
"character"
[0-9]* 		{return INTEGER;}
[0x00000000-0xFFFFFFFF] {return HEXA;}

/*
A FAIRE : 
[entier]??
[hexa]??



[A-Za-z][A-Za-z0-9]* {return IDENTIFIER;}
0|[1-9][0-9]*        {return INTEGER;}
";"                  {return SEMICOLON;}
"+"                  {return PLUS;}
"-"                  {return MINUS;}
"*"                  {return TIMES;}
"/"                  {return DIV;}      
"||"                 {return OR;} 
"&&"                 {return AND;}
"!"                  {return NOT;}
"<"                  {return LT;}
"<="                 {return LE;}
">"                  {return GT;}
">="                 {return GE;}
"="                  {return EQ;}
"!="                 {return DIFF;}
"("                  {return LPAR;}
")"                  {return RPAR;}

mettre les TOKEN ICI
*/
%%

int yywrap(){
   return 1;
}
