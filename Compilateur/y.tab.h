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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    tNUMBER = 258,
    tVAR = 259,
    tMAIN = 260,
    tOP = 261,
    tCP = 262,
    tOB = 263,
    tCB = 264,
    tINT = 265,
    tCONST = 266,
    tCOMA = 267,
    tSC = 268,
    tPRINTF = 269,
    tMUL = 270,
    tDIV = 271,
    tADD = 272,
    tSUB = 273,
    tEQU = 274,
    tIF = 275,
    tELSE = 276
  };
#endif
/* Tokens.  */
#define tNUMBER 258
#define tVAR 259
#define tMAIN 260
#define tOP 261
#define tCP 262
#define tOB 263
#define tCB 264
#define tINT 265
#define tCONST 266
#define tCOMA 267
#define tSC 268
#define tPRINTF 269
#define tMUL 270
#define tDIV 271
#define tADD 272
#define tSUB 273
#define tEQU 274
#define tIF 275
#define tELSE 276

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 17 "source.yacc" /* yacc.c:1909  */
int nb; char var [10];

#line 99 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
