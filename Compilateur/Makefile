all: compilateur

lex.yy.c: source.lex
	lex source.lex

y.tab.c y.tab.h: source.yacc
	yacc --verbose --debug -d -v source.yacc

compilateur: y.tab.c y.tab.h lex.yy.c tablesymbole.c instructions_asm.c
	gcc -Wall y.tab.c lex.yy.c tablesymbole.c instructions_asm.c -o compilateur
