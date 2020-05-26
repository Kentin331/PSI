#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"
#define MAX 256

int results[MAX]; 
int last_result = 0;


int new_result(int number){
printf("%d", number);
    results[last_result] = number;
    last_result++;
}

void affichage_results(){
printf("ok");
    printf("Interpreteur : \n\n");
    for(int i=0; i<last_result; i++) {
        printf("%d\n", results[i]);
    }
} 
