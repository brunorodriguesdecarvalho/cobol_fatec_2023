       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EM01-EX06.
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
       
       77 KM PIC 9(4).
       77 FIN PIC ZZ.Z99,99.

       PROCEDURE DIVISION.
      
       INICIO.

           DISPLAY ERASE.
           DISPLAY "APLICATIVO UBER (OU 99TAXI AHAHAH)" AT 0520.

           DISPLAY "QUANTO KM VAI RODAR:  " AT 1010.
           ACCEPT KM AT 1033.
           
           COMPUTE FIN = 5+(KM*4,50).

           DISPLAY "VALOR TOTAL DA CORRIDA: " AT 1510 FIN.

           DISPLAY " " AT 1910. 

       STOP RUN.




