%{
#include <stdio.h>
%}

%%

/* Keywords */
int|float|char|if|else|while|for|return { printf("Keyword: %s\n", yytext); }

/* Identifiers */
[a-zA-Z][a-zA-Z0-9]* { printf("Identifier: %s\n", yytext); }

/* Constants */
[0-9]+ { printf("Integer constant: %s\n", yytext); }
[0-9]+"."[0-9]* { printf("Floating-point constant: %s\n", yytext); }

/* Operators */
"+"|"-"|"*"|"/"|"%"|"="|"<"|">"|"=="|"!=" { printf("Operator: %s\n", yytext); }

/* Punctuation symbols */
";"|","|"("|")"|"{"|"}"|"["|"]" { printf("Punctuation: %s\n", yytext); }

/* Whitespace and newlines */
[ \t\n]+ ; /* Ignore whitespace */

. { printf("Unknown token: %s\n", yytext); } /* Catch-all for other characters */

%%

int main() {
    yylex();
    return 0;
}
