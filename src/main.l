
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
  int a = 0;

%}
PALAVRA {NUMEROV PALAVRAV}+;

%%
"[" { return ABRE; }
"]" { return FECHA; }

[,] {
  return VIRGULA;
}
["]*[a-zA-Z][a-zA-Z0-9]+[ ]*["]* {
  return PALAVRAV;
}
[0-9]+ {
yylval = atoi(yytext);
return NUMEROV;
}

[\n]+ {
  return EOL;
}

. { }

%%

int yywrap() {
  return 1;
}
