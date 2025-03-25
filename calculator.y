%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" 
int result; // Global degisken
%}

%union {
    int num; // NUMBER token'inin degeri
}

%token <num> NUMBER // Deger int olur demek
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN // İsaretler
%type <num> expr

// Oncelik ve yon siralanir. Soldan saga, arti ve eksi esit, carpi ve bolu onlardan once, parantezler hepsinden once
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc LPAREN RPAREN // Parentezlerin sirasi yoktur

%%

expr:
      expr PLUS expr          { $$ = $1 + $3; result = $$; }
    | expr MINUS expr         { $$ = $1 - $3; result = $$; }
    | expr TIMES expr         { $$ = $1 * $3; result = $$; }
    | expr DIVIDE expr        { 
                                  if ($3 == 0) {
                                      printf("Sifira bolunmez\n");
                                      exit(1);
                                  }
                                  $$ = $1 / $3; result = $$; 
                                }
    | LPAREN expr RPAREN      { $$ = $2; result = $$; }
    | NUMBER                  { $$ = $1; result = $$; }
    ;

%%

int main() {
    printf("Girdi: ");
    yyparse();  // Parse'a baslar
    printf(" Sonuc: %d\n", result); // Bittikten sonra sonucu basar
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Hata: %s\n", s);
    return 0;
}
