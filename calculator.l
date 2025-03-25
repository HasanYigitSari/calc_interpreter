%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" // For integration with Yacc
%}

%%
[0-9]+              { value = atoi(text); return NUMBER; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIVIDE; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
[ \t\n\r]+          { /* Ignore whitespace */ }
.                   { printf("Invalid character: %s\n", text); exit(1); }
%%

int wrap(void) {
    return 1;  // Indicate the end of input
}

