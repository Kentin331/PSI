%{

#include <stdio.h>

int yydebug = 0;

void yyerror(char *msg) {
    fprintf(stderr, "erreur: %s\n", msg);
    exit(1);
}

%}

%token tMAIN tOP tCP tOB tCB tINT tCONST tCOMA tSC tPRINTF tMUL tDIV tADD tSUB tEQU tVAR tNUMBER

%start S

%%

S : tMAIN{printf("Main");} tOP {printf("(");} tCP {printf(")");} tOB {printf("{");} BODY {printf("BODY");} tCB {printf("}");};

BODY : DECLARATIONS INSTRUCTIONS ;

DECLARATIONS :
            | tINT VARIABLES tSC DECLARATIONS {printf(" declaration\n");}
            | tINT VARIABLES tEQU tNUMBER tSC DECLARATIONS {printf(" decl + instanc\n");};

VARIABLES : tVAR 
            | tVAR tCOMA VARIABLES;



INSTRUCTIONS :
             | tVAR tEQU EXP tSC INSTRUCTIONS {printf("Affectation\n");}
             | tPRINTF tOP tVAR tCP tSC INSTRUCTIONS{printf("printf\n");};
            

EXP : 
    | EXP tADD EXP {printf(" add ");}
    | EXP tSUB EXP {printf(" sub ");}
    | EXP tDIV EXP {printf(" div ");}
    | EXP tMUL EXP {printf(" mul ");}
    | tVAR
    | tNUMBER
    | tOP EXP tCP EXP; 

    

%%

int main () {
    printf("Lancement du programme\n");    
    return yyparse();
}
