       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EM01-EX07.
       AUTHOR. BRUNO RODRIGUES DE CARVALHO. 
       INSTALLATION.  FATEC-SP.
       DATE-WRITTEN.  15/SEP/2023. 
       DATE-COMPILED. 15/SEP/2023. 
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. FATEC-SP.
       OBJECT-COMPUTER. BRUNO-PC.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CoeficienteA     PIC 9(5)V9(2).
       01 CoeficienteB     PIC 9(5)V9(2).
       01 Raiz             PIC S9(5)V9(2).
       
       PROCEDURE DIVISION.
       DISPLAY "Informe o coeficiente A (A diferente de 0): ".
       ACCEPT CoeficienteA.
       
       IF CoeficienteA = 0
           DISPLAY "O coeficiente A não pode ser igual a zero."
           GOBACK
       END-IF.
       
       DISPLAY "Informe o coeficiente B: ".
       ACCEPT CoeficienteB.
       
       COMPUTE Raiz = - CoeficienteB / CoeficienteA.
       
       DISPLAY "RES:" Raiz.
       
       STOP RUN.