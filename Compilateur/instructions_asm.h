struct asm_inst{
    char inst[100];
};

void add_inst(int r, int i, int j);
void mul_inst(int r, int i, int j);
void sou_inst(int r, int i, int j);
void div_inst(int r, int i, int j);
void cop_inst(int r, int i);
void afc_inst(int r, int i);
void load_inst(int r, int i);
void cmp_inst(int r, int i);
void store_inst(int r, int i);
void insert(char * inst);
void init_asm_inst();
void affichage_inst();
void printf_inst(int r);
void end_if_inst();
void jmpf_inst();
void jmp_inst();
