%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #define YY_DECL extern "C" int yylex()
    extern FILE *yyin;

    typedef struct {
        char name[50];
        int line;
    } Symbol;

    Symbol symbol_table[100];
    int symbol_count = 0;

    void add_to_symbol_table(const char *name, int line) {
        for (int i = 0; i < symbol_count; i++) {
            if (strcmp(symbol_table[i].name, name) == 0) {
                return;
            }
        }
        strcpy(symbol_table[symbol_count].name, name);
        symbol_table[symbol_count].line = line;
        symbol_count++;
    }

    void print_symbol_table() {
        printf("\nSymbol Table:\n");
        printf("--------------\n");
        for (int i = 0; i < symbol_count; i++) {
            printf("Name: %s, Line: %d\n", symbol_table[i].name, symbol_table[i].line);
        }
    }
%}

DIGIT   [0-9]
LETTER  [a-zA-Z_]
ID      {LETTER}({LETTER}|{DIGIT})*
NUM_INT {DIGIT}+
NUM_FLT {DIGIT}+"."{DIGIT}+
WS      [ \t]+
NEWLINE [\n]

%%

"int"               { printf("(%d, KEYWORD, 'int')\n", yylineno); }
"float"             { printf("(%d, KEYWORD, 'float')\n", yylineno); }
"void"              { printf("(%d, KEYWORD, 'void')\n", yylineno); }
"if"                { printf("(%d, KEYWORD, 'if')\n", yylineno); }
"else"              { printf("(%d, KEYWORD, 'else')\n", yylineno); }
"while"             { printf("(%d, KEYWORD, 'while')\n", yylineno); }
"return"            { printf("(%d, KEYWORD, 'return')\n", yylineno); }
"for"               { printf("(%d, KEYWORD, 'for')\n", yylineno); }

"==" | "!=" | "<" | ">" | "<=" | ">=" { printf("(%d, OPERATOR, '%s')\n", yylineno, yytext); }
"="                { printf("(%d, ASSIGN, '%s')\n", yylineno, yytext); }
"+" | "-" | "*" | "/" { printf("(%d, ARITH_OP, '%s')\n", yylineno, yytext); }

";"                { printf("(%d, SEMICOLON, '%s')\n", yylineno, yytext); }
","                { printf("(%d, COMMA, '%s')\n", yylineno, yytext); }
"("                { printf("(%d, OPEN_PAREN, '%s')\n", yylineno, yytext); }
")"                { printf("(%d, CLOSE_PAREN, '%s')\n", yylineno, yytext); }
"{"                { printf("(%d, OPEN_BRACE, '%s')\n", yylineno, yytext); }
"}"                { printf("(%d, CLOSE_BRACE, '%s')\n", yylineno, yytext); }
"["                { printf("(%d, OPEN_BRACKET, '%s')\n", yylineno, yytext); }
"]"                { printf("(%d, CLOSE_BRACKET, '%s')\n", yylineno, yytext); }

{NUM_INT}          { printf("(%d, NUM_INT, '%s')\n", yylineno, yytext); }
{NUM_FLT}          { printf("(%d, NUM_FLT, '%s')\n", yylineno, yytext); }

{ID}               { 
                        printf("(%d, IDENTIFIER, '%s')\n", yylineno, yytext); 
                        add_to_symbol_table(yytext, yylineno); 
                   }

{WS}               { /* Ignore whitespace */ }
{NEWLINE}          { /* Ignore newlines */ }

.                  { printf("(%d, ERROR, '%s')\n", yylineno, yytext); }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;
    yylex();
    fclose(input_file);

    print_symbol_table();
    return 0;
}
