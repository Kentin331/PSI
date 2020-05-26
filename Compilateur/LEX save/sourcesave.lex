%%
main printf(" Tmain ");
\{ printf("T{");
\} printf("T}");
\( printf(" T( ");
\) printf(" T) ");

int\ + printf(" Tint ");
const\ + printf("Tconst");

\  printf(" TEspace ");
\t printf(" TTab ");
\n printf(" TRaL ");
, printf(" Tcoma ");
; printf(" Tfin ");
printf printf(" Tprintf ");


\* printf(" Tfois ");
\/ printf(" Tdiv ");
\+ printf(" Tplus ");
\- printf(" Tmoins ");
\= printf(" Tegal ");

[a-z][a-z0-9_]* printf(" TVar");
[0-9]+ printf("TNombre");




%%
int yywrap(void){}

int main(void) {
printf("Début \n") ;
yylex();
return(0);
}
