%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" // Yacc ile entegrasyon icin
%}

%%
[0-9]+              { yyvalue = atoi(yytext); return NUMBER; } // atoi yytext'i sayiya cevirir
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIVIDE; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
[ \t\n\r]+          { /* Bos karakterler yok sayilir */ }
.                   { printf("Kabul edilmeyen karakter: %s\n", yytext); exit(1); }
%%

int yywrap(void) {
    return 1;  // Input'un sonuna gelinince 1 doner
}

