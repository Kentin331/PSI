%{
#include "y.tab.h"
#include "tablesymbole.h"
%}

%option noyywrap

%%
main return tMAIN;
\{ return tOB;
\} return tCB;
\( return tOP;
\) return tCP;
if return tIF;
else return tELSE; 
int\ + return tINT;
const\ + return tCONST;

, return tCOMA;
; return tSC;
printf return tPRINTF;


\* return tMUL;
\/ return tDIV;
\+ return tADD;
\- return tSUB;
\= return tEQU;


[a-z][a-z0-9_]* { strcpy(yylval.var, yytext);return tVAR;} 

[0-9]+ {yylval.nb = atof(yytext); return tNUMBER;}  




%%

/*
int main(void) {
printf("Début \n") ;
yylex();
return(0);
}
*/
