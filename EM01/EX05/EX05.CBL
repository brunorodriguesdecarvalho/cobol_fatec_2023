       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX05.
       AUTHOR. BRUNO RODRIGUES DE CARVALHO.
       INSTALLATION. FATEC-SP.
       DATE-WRITTEN. 04/03/2022.
       DATE-COMPILED. 04/03/2022.
        
       ENVIRONMENT DIVISION.
       
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. BRUNO-NOTEBOOK.
       OBJECT-COMPUTER. BRUNO-NOTEBOOK.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       
       INPUT-OUTPUT SECTION.
       
       FILE-CONTROL.

           SELECT CADALU ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
    
           SELECT CADAPR ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.
       FD CADALU
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADALU.DAT".
      
       01 REG-ENT.
           02 NUMERO-ENT PIC 9(05).
           02 NOME-ENT PIC X(20).
           02 NOTA1 PIC 9(02)V99.
           02 NOTA2 PIC 9(02)V99.
           02 FALTAS PIC 9(02).

       FD CADAPR
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADAPR.DAT".
       
       01 REG-SAI.
           02 NUMERO-SAI PIC 9(05).
           02 MEDIA PIC 9(02)V99.
            
       WORKING-STORAGE SECTION.

       77 FIM-ARQ PIC X(03) VALUE "NAO".

       PROCEDURE DIVISION.
       
           PERFORM INICIO.
	       PERFORM PRINCIPAL UNTIL FIM-ARQ EQUAL "SIM".
	       PERFORM TERMINO.
	    
           STOP RUN.

       INICIO.
    
           OPEN INPUT CADALU
                OUTPUT CADAPR.
           PERFORM LEITURA.      

       LEITURA.
    
           READ CADALU AT END MOVE "SIM" TO FIM-ARQ.

       PRINCIPAL.
    
	       PERFORM CALCULO.
	       PERFORM LEITURA.

       CALCULO.
           IF FALTAS IS NOT GREATER THAN 18 
              COMPUTE MEDIA = (NOTA1+NOTA2)/2
              IF MEDIA IS NOT LESS THAN 07,00
                 PERFORM GRAVACAO.
    
       GRAVACAO.
    
           MOVE NUMERO-ENT TO NUMERO-SAI.
           WRITE REG-SAI.
    
       TERMINO.

           CLOSE CADALU CADAPR.