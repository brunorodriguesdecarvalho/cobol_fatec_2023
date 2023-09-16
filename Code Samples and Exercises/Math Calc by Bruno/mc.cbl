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
           77 OP1 PIC 9(9) VALUE 0.
           77 OP2 PIC 9(9) VALUE 0.
           77 RES PIC 9(9) VALUE 0.

       PROCEDURE DIVISION.

           PERFORM EXIBIR-MENU UNTIL OPCAO = 9.
           DISPLAY ERASE.
           DISPLAY "CALCULADORA ENCERRADA".
           STOP RUN.

           SOMA.
              DISPLAY ERASE.

              DISPLAY "CALCULADORA DO BRUNO" AT 0328
              DISPLAY "SOMA" AT 0635
              DISPLAY "----" AT 0735

              DISPLAY "Digite o primeiro numero: " AT 1020
              MOVE 0 TO OP1.
              ACCEPT OP1 AT 1046.

              DISPLAY "Digite o segundo numero: " AT 1120
              MOVE 0 TO OP2.
              ACCEPT OP2 AT 1146.

              COMPUTE RES = OP1 + OP2.
              DISPLAY "---------------------------------------" AT 1220.
              DISPLAY "Resultado: " AT 1320.
              DISPLAY RES AT 1331.
              
              DISPLAY "OPCOES" AT 1611.
              DISPLAY "---------------------------------" AT 1701
              DISPLAY "1 - SOMAR NOVO VALOR AO RESULTADO" AT 1801.
              DISPLAY "2 - NOVA SOMA" AT 1901.
              DISPLAY "3 - VOLTAR AO MENU PRINCIPAL" AT 2001.
              DISPLAY "4 - SAIR" AT 2101.

              PERFORM UNTIL OPCAO = 4
                   DISPLAY "OPCAO SUB-MENU DESEJADA: " AT 2201
                   ACCEPT OPCAO AT 2226

                   EVALUATE OPCAO
                       WHEN 1
                           DISPLAY "Opcao escolhida:" AT 2230
                           DISPLAY "SOMAR NOVO VALOR AO RESULTADO" 
                           AT 2247
                       WHEN 2
                           DISPLAY "Opcao escolhida:" AT 2230
                           DISPLAY "NOVA SOMA                    "
                           AT 2247
                       WHEN 3
                           DISPLAY "Opcao escolhida:" AT 2230
                           DISPLAY "VOLTAR AO MENU PRINCIPAL     " 
                           AT 2247
                       WHEN 4
                           DISPLAY "SAINDO.                      "
                           AT 2230
                           DISPLAY ERASE
                       WHEN OTHER
                           DISPLAY "OPCAO INVALIDA, tente outra vez."
                             AT 2230
                   END-EVALUATE
               END-PERFORM.

           EXIBIR-MENU.
               PERFORM UNTIL OPCAO = 9
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

                   DISPLAY "OPCAO DESEJADA: " AT 2130
                   ACCEPT OPCAO AT 2146

                   EVALUATE OPCAO
                       WHEN 1
                           PERFORM SOMA
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
               