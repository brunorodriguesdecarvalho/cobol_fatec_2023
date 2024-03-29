       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EM01-EX05.
       AUTHOR. BRUNO RODRIGUES DE CARVALHO. 
       INSTALLATION.  FATEC-SP.
       DATE-WRITTEN.  15/SEP/2023. 
       DATE-COMPILED. 15/SEP/2023. 
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. FATEC-SP.
       OBJECT-COMPUTER. BRUNO-PC.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.

       
       77 QTD PIC 9(3).
       77 SAL PIC 9(6).
       77 VTV PIC 9(7).

       77 FEE PIC 9(2) VALUE 5.
       
       77 VCV PIC 9(6).
       77 FIN PIC ZZ.ZZZ.Z99,99.

       PROCEDURE DIVISION.
      
       INICIO.

           DISPLAY ERASE.
           DISPLAY "CALCULO SALARIO FINAL" AT 0520.

           DISPLAY "NUMERO DE CARROS VENDIDOS: " AT 1010.
           ACCEPT QTD AT 1038.
           
           DISPLAY "VALOR TOTAL DE VENDAS: " AT 1110.
           ACCEPT VTV AT 1134.

           DISPLAY "VALOR POR CARRO VENDIDO: " AT 1210.
           ACCEPT VCV AT 1236.
           
           DISPLAY "SALARIO FIXO: " AT 1310.
           ACCEPT SAL AT 1324.


           COMPUTE FIN = SAL+(QTD*VCV)+(VTV*FEE).

           DISPLAY "SALARIO FINAL: " AT 1510 FIN.

           DISPLAY " " AT 1910. 

       STOP RUN.




