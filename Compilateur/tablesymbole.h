struct symb {
    char id [10] ;
    int num_id;
    int cte_or_var;
} ;

void init_table();

int scan_libre();

int scan_temporary_libre();

int new_symbol(char * id, int cv);

int new_temporary_symbol();

void free_table(char *id);

void affichage_table();

int find_id(char * id);

int find_num_id(int num_id);

void update_symbol(char * id, int cv);
