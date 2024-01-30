%{
#include <stdio.h>
%}

%%

/* a) Strings ending in 00 */
[0-9]*00 { printf("Token (a): %s\n", yytext); }

/* b) Strings with three consecutive 222's */
[0-9]*222[0-9]* { printf("Token (b): %s\n", yytext); }

/* c) Strings with at least two 5's in every block of five */
([0-9]{0,4}55[0-9]*)+ { printf("Token (c): %s\n", yytext); }

/* d) Strings starting with 1, congruent to 0 modulo 5 in binary */
1(01*01*01*)* { printf("Token (d): %s\n", yytext); }

/* e) Strings with 1 as the 10th symbol from the right end */
[0-9]{9}1.* { printf("Token (e): %s\n", yytext); }

/* f) Four-digit numbers with a sum of 9 */
[1-8][0-9][0-9][0123456789-][0-9] {
    int sum = 0;
    for (int i = 0; i < 4; ++i) {
        sum += yytext[i] - '0';
    }
    if (sum == 9) {
        printf("Token (f): %s\n", yytext);
    }
}

/* g) Four-digit numbers in ascending order */
[0-3][1-4][2-5][3-6][4-7][4-8][5-9] { printf("Token (g): %s\n", yytext); }

.|\n { /* Ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
