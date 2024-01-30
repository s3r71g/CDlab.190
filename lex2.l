%{
#include <stdio.h>
%}

%%

[0-9]+"."[0-9]* { printf("Floating-point number: %s\n", yytext); }

.|\n             { /* Ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
