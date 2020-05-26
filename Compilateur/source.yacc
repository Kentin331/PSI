%{

#include <stdio.h>
#include <stdlib.h>
#include "tablesymbole.h"
#include "instructions_asm.h"

int yydebug = 0;

void yyerror(char *msg) {
    fprintf(stderr, "erreur: %s\n", msg);
    exit(1);
}

%}

%union{int nb; char var [10];}  
%token <nb> tNUMBER
%token <var> tVAR
%type <nb> EXP
%type <nb> CONSTANTES
%type <nb> VARIABLES
%type <nb> INSTRUCTIONS
%type <nb> IF
%type <nb> ELSE 

%token tMAIN tOP tCP tOB tCB tINT tCONST tCOMA tSC tPRINTF tMUL tDIV tADD tSUB tEQU tIF tELSE

%left tADD tSUB
%left tDIV tMUL
%right tEQU

%start S
%%

S : tMAIN{init_table(); init_asm_inst(); new_symbol("main", 1);} tOP tCP tOB BODY tCB {printf("\n"); affichage_table(); affichage_inst();};

BODY : DECLARATIONS INSTRUCTIONS ; 

DECLARATIONS :
            | CV tSC DECLARATIONS 
            | CV tEQU tNUMBER tSC DECLARATIONS;

CV : tCONST CONSTANTES
   | tINT VARIABLES;


CONSTANTES  : tVAR {int t = find_id($1); if(t==-1) t = new_symbol($1, 0); $$ = t; }
            | tVAR tCOMA CONSTANTES;
            

VARIABLES   : tVAR {int t = find_id($1); if(t==-1) t = new_symbol($1, 1); $$ = t; }
            | tVAR tCOMA VARIABLES;


INSTRUCTIONS :
             | tVAR tEQU EXP {int t = find_id($1); if(t==-1) t = new_symbol($1, 1); afc_inst(t,$3);} tSC INSTRUCTIONS 
             | tPRINTF tOP tVAR {int t = find_id($3); printf_inst(t);} tCP tSC INSTRUCTIONS
             | IF INSTRUCTIONS;

IF : tIF tOP EXP { jmpf_inst();} tCP tOB BODY tCB ELSE;

ELSE : {end_if_inst();}
     | tELSE {jmp_inst();} tOB BODY tCB {end_if_inst();};


EXP : EXP tADD EXP { int t = new_temporary_symbol(); add_inst(t, $1, $3); $$ = t; }
    | EXP tSUB EXP { int t = new_temporary_symbol(); sou_inst(t, $1, $3); $$ = t; }
    | EXP tDIV EXP { int t = new_temporary_symbol(); div_inst(t, $1, $3); $$ = t; }
    | EXP tMUL EXP { int t = new_temporary_symbol(); mul_inst(t, $1, $3); $$ = t; }
    | EXP tEQU tEQU EXP {cmp_inst($1, $4);}
    | tVAR { int t = find_id($1); if(t==-1) t = new_symbol($1, 1); $$ = t; }
    | tNUMBER { int t = new_temporary_symbol(); $$ = t; }
    | tOP EXP tCP { int t = new_temporary_symbol(); $$ = t; }

    

%%

int main () {
    printf("Lancement du programme\n");    
    return yyparse();
}
