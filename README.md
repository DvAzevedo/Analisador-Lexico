# Analisador-Léxico

    definitions
    %%
    rules
    %%
    user code


    Criar o arquivo lex.yy.c:
    flex lexico.l

    Gerar executável:
    g++ lex.yy.c -lfl -o lexico

    Iniciar análise lexica:
    ./lexico <nome do arquivo> main.lex

    ex:
    ./lexico main.c main.lex
    (1, ERROR, '/')
    (1, ERROR, '*')
    (1, IDENTIFIER, 'main')
    (1, ERROR, '.')
    (1, IDENTIFIER, 'c')
    (1, ERROR, '*')
    (1, ERROR, '/')
    (1, KEYWORD, 'void')
    (1, IDENTIFIER, 'main')
    (1, OPEN_PAREN, '(')
    (1, KEYWORD, 'void')
    (1, CLOSE_PAREN, ')')
    (1, OPEN_BRACE, '{')
    (1, KEYWORD, 'int')
    (1, IDENTIFIER, 'a')
    (1, SEMICOLON, ';')
    (1, IDENTIFIER, 'a')
    (1, ASSIGN, '=')
    (1, NUM_INT, '10')
    (1, SEMICOLON, ';')
    (1, ERROR, '/')
    (1, ERROR, '*')
    (1, IDENTIFIER, 'Testando')
    (1, IDENTIFIER, 'coment')
    (1, ERROR, '�')
    (1, ERROR, '�')
    (1, IDENTIFIER, 'rio')
    (1, IDENTIFIER, 'em')
    (1, IDENTIFIER, 'bloco')
    (1, ERROR, '.')
    (1, ERROR, '*')
    (1, ERROR, '/')
    (1, KEYWORD, 'if')
    (1, OPEN_PAREN, '(')
    (1, IDENTIFIER, 'a')
    (1, ERROR, '>')
    (1, NUM_INT, '9')
    (1, CLOSE_PAREN, ')')
    (1, OPEN_BRACE, '{')
    (1, IDENTIFIER, 'a')
    (1, ASSIGN, '=')
    (1, OPEN_PAREN, '(')
    (1, NUM_INT, '4')
    (1, SEMICOLON, '+')
    (1, NUM_INT, '5')
    (1, CLOSE_PAREN, ')')
    (1, ERROR, '*')
    (1, NUM_INT, '3')
    (1, SEMICOLON, ';')
    (1, CLOSE_BRACE, '}')
    (1, CLOSE_BRACE, '}')

    Symbol Table:
    --------------
    Name: main, Line: 1
    Name: c, Line: 1
    Name: a, Line: 1
    Name: Testando, Line: 1
    Name: coment, Line: 1
    Name: rio, Line: 1
    Name: em, Line: 1
    Name: bloco, Line: 1


