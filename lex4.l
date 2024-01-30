%{
#include <stdio.h>
#include <string.h>

FILE *input_file, *output_file;
char string[200];
%}

delim [ \t\n]
ws {delim}+
nows [^ws]

%%

[\n] {fprintf(output_file, "%s\n", string); string[0] = '\0';}
[ ]* {fprintf(output_file, "%s", " "); string[0] = '\0';}
. strcat(string, yytext);

%%

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <output_file>\n", argv[0]);
        return 1;
    }

    input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    output_file = fopen(argv[2], "w");
    if (!output_file) {
        perror("Error opening output file");
        fclose(input_file);
        return 1;
    }

    yylex();

    fclose(input_file);
    fclose(output_file);
    return 0;
}
