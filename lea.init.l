%{
#include "lea.init.tab.h"
%}

integer	("0x"([0-9]|[A-F])+) | ("-"(0|[1-9][0-9]*)) | ((0|[1-9][0-9]*))


%option nounput noinput
%%


/* not sure about these two :*/
"'"{name}"'"	{return TOKEN_IDENTIFIER;}
/* TOKEN_PROCEDURE ???*/


"||"	{return TOKEN_OR;}
"&&"	{return TOKEN_AND;}
"<="	{return TOKEN_LE;}
">="	{return TOKEN_GE;}
"!="	{return TOKEN_NE;}
":="	{return TOKEN_AFF;}
".."	{return TOKEN_DOTDOT;
"if"		{return TOKEN_IF;}
"then"		{return TOKEN_THEN;}
"else"		{return TOKEN_ELSE;}

[^0-9]"-"[0-9]+	{return NEG;}

"function"	{return TOKEN_FUNCTION;}
"boolean"	{return TOKEN_BOOLEAN;}
"integer"	{return TOKEN_INTEGER;}
"character"	{return TOKEN_CHARACTER;}
"print"		{return TOKEN_PRINT;}
"begin"		{return TOKEN_BEGIN;}
"end"		{return TOKEN_END;}
"return"	{return TOKEN_RETURN;}
"array"		{return TOKEN_ARRAY;}
"of"		{return TOKEN_OF;}
"type"		{return TOKEN_TYPE;}
"do"		{return TOKEN_DO;}
"while"		{return TOKEN_WHILE;}
"var"		{return TOKEN_VAR;}
"new"		{return TOKEN_NEW;}
"null"		{return TOKEN_NULL;}
"dispose"	{return TOKEN_DISPOSE;}
"println"	{return TOKEN_PRINTLN;}
"false"		{return TOKEN_FALSE;}
"true"		{return TOKEN_TRUE;}

{integer}	{return TOKEN_INTEGER;}
%%

int yywrap(){
   return 1;
}
