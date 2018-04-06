

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}
%token VIRGULA PALAVRAV ABRE FECHA EOL NUMEROV PALAVRA

%%
PROGRAMA:
  PROGRAMA EXPRESSAO EOL  {
    printf("OK\n");
  }|;

EXPRESSAO:
   ABRE SEQUENCIA FECHA {
  }|ABRE FECHA{
  }|ABRE EXPRESSAO FECHA{
  } ;

SEQUENCIA:
  SEQUENCIA VIRGULA SEQUENCIA{
  }| PALAVRAV{
  }| NUMEROV{
  }|EXPRESSAO VIRGULA EXPRESSAO{
  }|SEQUENCIA VIRGULA EXPRESSAO{
  }|EXPRESSAO VIRGULA SEQUENCIA;


%%

void yyerror(char *s) {
  printf("ERRO\n");
}

int main() {
  yyparse();
    return 0;

}
