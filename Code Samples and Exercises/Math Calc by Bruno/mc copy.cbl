       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATCALC.
       AUTHOR. BRUNO RODRIGUES DE CARVALHO.
       DATE-WRITTEN. 21-AUG-2023.
       DATE-COMPILED. 21-AUG-23.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       OBJECT-COMPUTER. NOTEBOOK-BRUNO.
       SOURCE-COMPUTER. NOTEBOOK-BRUNO.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           77 OPCAO PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.

           PERFORM EXIBIR-MENU UNTIL OPCAO = 9.
           DISPLAY ERASE.
           DISPLAY "CALCULADORA ENCERRADA".
           STOP RUN.

           EXIBIR-MENU.
               DISPLAY ERASE
               DISPLAY "CALCULADORA DO BRUNO" AT 0328
               DISPLAY "MENU" AT 0635
               DISPLAY "----" AT 0735
               DISPLAY "1 - SOMA" AT 1030
               DISPLAY "2 - SUBTRACAO" AT 1130
               DISPLAY "3 - MULTIPLICACAO" AT 1230
               DISPLAY "4 - DIVISAO" AT 1330
               DISPLAY "5 - MATRIZES*" AT 1430
               DISPLAY "9 - SAIR" AT 1930

               PERFORM UNTIL OPCAO = 9
                   DISPLAY "OPCAO DESEJADA: " AT 2130
                   ACCEPT OPCAO AT 2146

                   EVALUATE OPCAO
                       WHEN 1
                           DISPLAY "Opcao escolhida: SOMA.          " 
                           AT 2230
                       WHEN 2
                           DISPLAY "Opcao escolhida: SUBTRACAO.     " 
                           AT 2230
                       WHEN 3
                           DISPLAY "Opcao escolhida: MULTIPLICACAO. "
                           AT 2230
                       WHEN 4
                           DISPLAY "Opcao escolhida: DIVISAO.       "
                           AT 2230
                       WHEN 5
                           DISPLAY "Opcao escolhida: MATRIZES.      "
                           AT 2230
                       WHEN 9
                           DISPLAY "SAINDO.                         "
                           AT 2230
                       WHEN OTHER
                           DISPLAY "OPCAO INVALIDA, tente outra vez."
                             AT 2230
                   END-EVALUATE
               END-PERFORM.
               