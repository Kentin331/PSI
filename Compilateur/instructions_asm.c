#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "instructions_asm.h"
#define MAX 500

int line = 0; 
struct asm_inst instructions[MAX];
struct asm_inst ordered_instructions[MAX];
int nb_exp=0;
int if_imbrique=0;

void add_inst(int r, int i, int j){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "ADD %d %d %d\n", r, i, j);
    insert(instruction);
    free(instruction);
}

void mul_inst(int r, int i, int j){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "MUL %d %d %d\n", r, i, j);
    insert(instruction);
    free(instruction);
}

void sou_inst(int r, int i, int j){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "SOU %d %d %d\n", r, i, j);
    insert(instruction);
    free(instruction);

}


void div_inst(int r, int i, int j){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "DIV %d %d %d\n", r, i, j);
    insert(instruction);
    free(instruction);
}

void cmp_inst(int r, int i){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "CMP %d %d\n", r, i);
    insert(instruction);
    free(instruction);
}

void cop_inst(int r, int i){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "COP %d %d\n", r, i);
    free(instruction);

}

void afc_inst(int r, int i){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "AFC %d %d\n", r, i);
    insert(instruction);
    free(instruction);
}


void load_inst(int r, int i){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "LOAD %d %d\n", r, i);
    free(instruction);
}

void store_inst(int r, int i){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "STORE %d %d\n", r, i);
    free(instruction);
}

void printf_inst(int r){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "PRINT %d \n", r);
    insert(instruction);
    free(instruction);
}

void end_if_inst(){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "END CMP\n");
    insert(instruction);
    free(instruction);
}

void jmpf_inst(){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "JMPF\n");
    insert(instruction);
    free(instruction);
}

void jmp_inst(){
    char * instruction = malloc(sizeof(char)*100);
    sprintf(instruction, "JMP\n");
    insert(instruction);
    free(instruction);
}

void insert(char * inst){
    struct asm_inst new_line;
    strcpy(new_line.inst, inst); 
    instructions[line] = new_line;
    line++;
}

void init_asm_inst(){
    for(int i=0; i< MAX; i++){
        strcpy(instructions[i].inst,"");
    }
}


void affichage_inst(){

   printf("\nInstructions :\n\n");
    for (int i=0; i<line; i++){
        int l=i;
        if (strcmp(instructions[i].inst,"JMPF\n") == 0) {
            if_imbrique++;
            while(strcmp(instructions[l].inst,"END CMP\n")!= 0 && strcmp(instructions[l].inst,"JMP\n")!=0 || if_imbrique!=0){
                l++;
                if (strcmp(instructions[l].inst,"JMPF\n") == 0) if_imbrique++;
                if (strcmp(instructions[l].inst,"END CMP\n") == 0 || strcmp(instructions[l].inst,"JMP\n") == 0) if_imbrique--;
            }
            char * instruction = malloc(sizeof(char)*100);
            if(strcmp(instructions[l].inst,"JMP\n") == 0) sprintf(instruction, "JMPF L%d\n",l+1);
            else sprintf(instruction, "JMPF L%d\n",l);
            struct asm_inst new_line;
            strcpy(new_line.inst, instruction); 
            instructions[i] = new_line;
            free(instruction);
        }
    }
    for (int i=0; i<line; i++){
        int l=i;
        if (strcmp(instructions[i].inst,"JMP\n") == 0) {
            int check=1;
            while(strcmp(instructions[l].inst,"END CMP\n" )!= 0 || check==1){
                l++;
                  if (strcmp(instructions[l+1].inst,instructions[line].inst) == 0) check=0;
            }
            char * instruction = malloc(sizeof(char)*100);
            sprintf(instruction, "JMP L%d\n",l);
            struct asm_inst new_line;
            strcpy(new_line.inst, instruction); 
            instructions[i] = new_line;
            free(instruction);
        }
    } 
    for (int i=0; i<line; i++) printf("L%d : %s", i, instructions[i].inst);
}
