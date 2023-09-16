       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EM01-EX03.
       AUTHOR. BRUNO RODRIGUES DE CARVALHO. 
       INSTALLATION.  FATEC-SP.
       DATE-WRITTEN.  18/AUG/2023. 
       DATE-COMPILED. 18/AUG/2023. 
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. FATEC-SP.
       OBJECT-COMPUTER. BRUNO-PC.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       
       DATA DIVISION. 
       WORKING-STORAGE SECTION.

       77 ANO PIC 9(004) VALUE ZEROS.
       77 MES PIC 9(002) VALUE ZEROS.
       77 DIA PIC 9(002) VALUE ZEROS.
       77 RES1 PIC 9(005) VALUE ZEROS.
       77 RES2 PIC 9(005) VALUE ZEROS.
       77 RES3 PIC 9(005) VALUE ZEROS.

       PROCEDURE DIVISION.
      
       INICIO.

           DISPLAY ERASE.
           DISPLAY "CALCULO DIAS" AT 0521.
           DISPLAY "ANO (4 DIGITOS): " AT 1010.
           DISPLAY "MES (2 DIGITOS): " AT 1210.
           DISPLAY "DIA (2 DIGITOS): " AT 1410.
              
           ACCEPT ANO AT 1027.
           ACCEPT MES AT 1227.
           ACCEPT DIA AT 1427.

           COMPUTE RES1 = ((2023 - ANO) * 365).

           IF MES > 9 THEN
               COMPUTE RES2 = (9 - MES) * 30
               IF DIA > 15 THEN
                   COMPUTE RES3 = RES1 + RES2 + DIA
               ELSE 
                   COMPUTE RES3 = RES1 + RES2 + DIA - 30
           ELSE     
               IF DIA > 15 THEN
                   COMPUTE RES3 = RES1 - 365 + RES2 + DIA
               ELSE 
                   COMPUTE RES3 = RES1 - 365 + RES2 + DIA - 30.   
           
           DISPLAY "RESPOSTA (ANOS EM DIAS): " AT 1610 RES1.
           DISPLAY "RESPOSTA (MES EM DIAS): " AT 1710 RES2.
           DISPLAY "RESPOSTA (FINAL): " AT 1810 RES3.
           DISPLAY " " AT 1910. 

       STOP RUN.




