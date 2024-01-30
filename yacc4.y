%{
#include <stdio.h>

int yyerror(const char *s);
double binary_value;
%}

%token INTEGER SIGN DOT BINARY_DIGIT

%%

number: SIGN integer | integer

integer: decimal part { printf("Decimal: %.2f\n", yyval); }

decimal: DOT fraction { yyval *= 0.1; } | /* Empty for integer */

fraction: { yyval = 0.0; }
         | binary_fraction { yyval += binary_value; }
         | binary_fraction binary_fraction { yyval += binary_value * 0.1; }
         | ... (repeat for additional decimal places)

binary_fraction: '1' { binary_value = 1.0; }
                | '0' { binary_value = 0.0; }

%%

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}
