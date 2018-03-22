%{
#include "lea.init.tab.h"
%}



%option nounput noinput
%%


"+"	{return PLUS;}
"-" {return LESS;}
"*"	{return MULT;}
"/"	{return DIV; }
"||"	{return OR;}
"&&"	{return AND;}
[0-9]^"-"[0-9]+	{return NEG;} // -{nombre}, si {nombre}-{nombre} alors pas reconnu
//vérifier le ^
"!"	{return NOT;}
"<"/*sans '=' après*/	{return ST;}
"<="	{return SET;}
">"/*sans '=' après*/	{return GT;}
">="	{return GET;}
":="	{return AFF;}
/*sans le ';' et le '!'*/"="	{return EQ;}
"!="	{return NOTEQ;}
"("		{return LP;}
")"		{return RP;}

/*
A FAIRE : 
;
[
]
..
function
boolean
integer
begin
end
return
array
of
if
then
else
do
while
^ //pointeur
var
new //utilisation des variables dans les fonctions
null
dispose
'
"
println
character
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
