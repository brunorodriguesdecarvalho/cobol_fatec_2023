       IDENTIFICATION DIVISION.
       PROGRAM-ID.      PROG01.
       AUTHOR.          BRUNO CARVALHO.
       INSTALLATION.    FATEC-SP.
       DATA-WRITTEN.    10/04/2021.
       DATA-COMPILED.   10/04/2021.
        
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WRK-OPCAO     PIC X(001) VALUE SPACES.

       SCREEN SECTION.
       01 TELA-PRINCIPAL.

           02 BLANK SCREEN.
           02 LINE 1 COL 21 VALUE "----------------------------------------".
           02 LINE 2 COL 21 VALUE "MANUTENCAO DE CLIENTES -  MENU PRINCIPAL".
           02 LINE 3 COL 21 VALUE "----------------------------------------".
           02 LINE 11 COL 34 VALUE "1 -Inclusao".
           02 LINE 12 COL 34 VALUE "2 -Alteracao".
           02 LINE 13 COL 34 VALUE "3 -Consultar".
           02 LINE 14 COL 34 VALUE "4 -Excluir".
           02 LINE 15 COL 34 VALUE "5 -Sair".
           02 LINE 17 COL 34 VALUE "OPCAO: ()".
           02 OPCAO LINE 17 COL 42 PIC X USING WRK-OPCAO AUTO.

       PROCEDURE DIVISION.

       INICIO.
           DISPLAY TELA-PRINCIPAL.
           ACCEPT TELA-PRINCIPAL.
           STOP RUN.