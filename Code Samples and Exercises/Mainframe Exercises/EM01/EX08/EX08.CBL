       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EM01-EX08.
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
       
       77 L1   PIC 9(2) VALUE ZEROS.
       77 L2   PIC 9(2) VALUE ZEROS.
       77 L3   PIC 9(2) VALUE ZEROS.
       77 FLAG PIC X(30) VALUE 'NAO FORMAM UM TRIANGULO'.


       PROCEDURE DIVISION.
      
       INICIO.

           DISPLAY ERASE.
           DISPLAY "VERIFICADOR DE TRIANGULOS" AT 0520.

           DISPLAY "LADO 1: " AT 1010.
           ACCEPT L1 AT 1019.

           DISPLAY "LADO 2: " AT 1110.
           ACCEPT L2 AT 1119.

           DISPLAY "LADO 3: " AT 1210.
           ACCEPT L3 AT 1219.

           IF (L1+L2)>L3 THEN
               IF (L1+L3)>L2 THEN
                   IF (L2+L3)>L1 THEN
                       IF (L1 = L2) AND (L1 = L3) THEN
                          MOVE 'TRIANGULO EQUILATERO' TO FLAG                       
                       ELSE 
                           IF (L1=L2) OR (L2=L3) OR (L1=L3) THEN
                               MOVE 'TRIANGULO ISOCELES' TO FLAG
                           ELSE 
                               MOVE 'TRIANGULO ESCALENO' TO FLAG.
                       
                       
           DISPLAY "RESULTADO DO TESTE: " AT 1410 FLAG.

           DISPLAY " " AT 1910. 

       STOP RUN.




