/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_LEA_INIT_TAB_H_INCLUDED
# define YY_YY_LEA_INIT_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TOKEN_AFF = 258,
    TOKEN_AND = 259,
    TOKEN_ARRAY = 260,
    TOKEN_BEGIN = 261,
    TOKEN_CHARACTER = 262,
    TOKEN_DISPOSE = 263,
    TOKEN_DO = 264,
    TOKEN_DOTDOT = 265,
    TOKEN_ELSE = 266,
    TOKEN_END = 267,
    TOKEN_FALSE = 268,
    TOKEN_FUNCTION = 269,
    TOKEN_GE = 270,
    TOKEN_IF = 271,
    TOKEN_LE = 272,
    TOKEN_NEW = 273,
    TOKEN_NE = 274,
    TOKEN_NULL = 275,
    TOKEN_OF = 276,
    TOKEN_OR = 277,
    TOKEN_PRINT = 278,
    TOKEN_PRINTLN = 279,
    TOKEN_PROCEDURE = 280,
    TOKEN_THEN = 281,
    TOKEN_TYPE = 282,
    TOKEN_BOOLEAN = 283,
    TOKEN_INTEGER = 284,
    TOKEN_RETURN = 285,
    TOKEN_TRUE = 286,
    TOKEN_VAR = 287,
    TOKEN_WHILE = 288,
    IDENTIFIER = 289,
    CHARACTER = 290,
    INTEGER = 291
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LEA_INIT_TAB_H_INCLUDED  */
