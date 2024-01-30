#include <stdio.h>
#include <ctype.h>
#include <string.h>


const char *keywords[] = {"if", "while", "int", "float", "return"};

// Function to check if a given word is a keyword
int isKeyword(char *word) {
  for (int i = 0; i < sizeof(keywords) / sizeof(keywords[0]); ++i) {
    if (strcmp(word, keywords[i]) == 0) {
      return 1;
    }
  }
  return 0;
}

// Function to identify the type of token
int get_token(char *buffer) {
  int i;

  // Check for keywords
  if (isKeyword(buffer)) {
    return 1; // Keyword
  }

  // Check for identifiers (alphanumeric + underscore)
  if (isalpha(buffer[0]) || buffer[0] == '_') {
    for (i = 1; buffer[i] != '\0'; ++i) {
      if (!isalnum(buffer[i]) && buffer[i] != '_') {
        break;
      }
    }
    if (buffer[i] == '\0') {
      return 2; // Identifier
    }
  }

  // Check for numbers (including floats)
  if (isdigit(buffer[0]) || (buffer[0] == '.' && isdigit(buffer[1]))) {
    for (i = 1; buffer[i] != '\0'; ++i) {
      if (!isdigit(buffer[i]) && buffer[i] != '.' && buffer[i] != 'e' && buffer[i] != '+' && buffer[i] != '-') {
        break;
      }
    }
    if (buffer[i] == '\0') {
      return 3; // Number
    }
  }

  // Check for operators
  if (strchr("+-*/%<>&|!", buffer[0])) {
    return 4; // Operator
  }

  // Check for punctuations
  if (strchr(",;(){}[]", buffer[0])) {
    return 5; // Punctuation
  }

  // Unknown token
  return 0;
}

int main() {
  char input[100];

  printf("Enter your code snippet:\n");
  fgets(input, sizeof(input), stdin);

  char *token = strtok(input, " \t\n"); // Split input into tokens

  while (token != NULL) {
    int type = get_token(token);

    switch (type) {
      case 1:
        printf("Keyword: %s\n", token);
        break;
      case 2:
        printf("Identifier: %s\n", token);
        break;
      case 3:
        printf("Number: %s\n", token);
        break;
      case 4:
        printf("Operator: %s\n", token);
        break;
      case 5:
        printf("Punctuation: %s\n", token);
        break;
      default:
        printf("Unknown token: %s\n", token);
        break;
    }

    token = strtok(NULL, " \t\n"); // Get next token
  }

  return 0;
}
