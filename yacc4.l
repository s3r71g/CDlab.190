%{
#include "y.tab.h"
%}

%%

{INTEGER}+ { yylval = atoi(yytext); return INTEGER; }
"."        { yylval = '.'; return DOT; }
"-"        { yylval = '-'; return SIGN; }

[01]      { yylval = yytext[0] - '0'; return BINARY_DIGIT; }

.|\n       { /* Ignore other characters and newlines */ }

%%
