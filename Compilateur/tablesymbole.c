#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tablesymbole.h"  
#define MAX 256

//Tableau de struct sous la forme 

struct symb table[MAX]; 
int pointeur_libre = 0;

void init_table(){
    for(int i = 0; i<MAX; i++){
        table[i].cte_or_var = -1;
        strcpy(table[i].id, "");
    }  
} 

int scan_libre(){
    for(int i = 0; i<MAX; i++){
        if (strcmp(table[i].id,"") == 0) return(i);
    } 
} 


int scan_temporary_libre(){
    for(int i = MAX; i>0; i--){
        if (strcmp(table[i].id,"") == 0) return(i);
    } 
} 


int new_symbol(char * id, int cv){
        struct symb new_s;
        strcpy(new_s.id, id);
        new_s.cte_or_var=cv;
        //recherche case vide
        pointeur_libre = scan_libre();
        //Ajout dans le tableau
        table[pointeur_libre] = new_s;     
        return pointeur_libre;
}

int new_temporary_symbol(){
    struct symb new_s;
    strcpy(new_s.id, "temp");
    new_s.cte_or_var=1;
    //recherche case vide
    pointeur_libre = scan_temporary_libre();
    //Ajout dans le tableau
    table[pointeur_libre] = new_s;      
    return pointeur_libre;
}

int find_id(char * id){
    for(int i =0; i < MAX; i++){
       if(strcmp(table[i].id,id) == 0) return i;
    }
   return -1;
} 

void update_symbol(char * id, int cv){
    for(int i =0; i < MAX; i++){
       if(strcmp(table[i].id,id) == 0){ table[i].cte_or_var = cv;
        printf("CV = %d", table[i].cte_or_var);} 
    }
} 


void free_table(char *id){
    for(int i =0; i < MAX; i++)
   {
       if(strcmp(table[i].id,id) == 0){
            table[i].cte_or_var = -1; 
            strcpy(table[i].id, "");
       } 
   } 
} 

void affichage_table(){
    printf("Table des symboles : \n\n");
    for(int i=0; i<MAX ; i++) {
        if (strcmp(table[i].id,"") != 0)  printf("ID = %s | CV = %d \n", table[i].id, table[i].cte_or_var);
    }
} 
