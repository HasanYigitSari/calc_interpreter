%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" // Yacc ile entegrasyon icin
%}

%%
[0-9]+              { value = atoi(text); return NUMBER; } // atoi text'i sayiya cevirir
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIVIDE; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
[ \t\n\r]+          { /* Bos karakterler yok sayilir */ }
.                   { printf("Invalid character: %s\n", text); exit(1); }
%%

int wrap(void) {
    return 1;  // Input'un sonuna gelinince 1 doner
}

