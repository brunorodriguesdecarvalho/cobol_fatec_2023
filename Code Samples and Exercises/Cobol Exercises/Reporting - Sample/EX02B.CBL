       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX02.
       AUTHOR.        BRUNO CARVALHO.
       INSTALLATION.  BRUNO-PC.
       DATE-WRITTEN.  19/06/2023.
       DATE-COMPILED. 19/06/2023.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS.
      *1)   

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. BRUNO-PC.
       OBJECT-COMPUTER. BRUNO-PC.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQMOV ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT CADANT ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT CADATU ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       
       FD ARQMOV
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "ARQMOV.DAT".
       01 REG-MVTO.
           02 CC-MOV    PIC 9(03).
           02 TIPO-MOV  PIC X(01).
           02 ENDER-MOV PIC X(50).
       
       FD CADANT
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADANT.DAT".
       01 REG-ANT.
           03 CC-ANT   PIC 9(03).
           03 TIPO-ANT  PIC X(01).
           03 ENDER-ANT  PIC X(50).

       FD CADATU
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADATU.DAT".
       01 REG-ATU.
           03 CC-ATU  PIC 9(03).
           03 TIPO-ATU  PIC X(01).
           03 ENDER-ATU PIC X(50).
       
       WORKING-STORAGE SECTION.
       77 CH-MVTO PIC X(04) VALUE SPACES.
       77 CH-ANT  PIC X(04) VALUE SPACES.

       PROCEDURE DIVISION.

       PGM-EX02.
           PERFORM INICIO.
           PERFORM PRINCIPAL
               UNTIL
               CH-MVTO EQUAL CH-ANT AND
               CH-ANT EQUAL HIGH-VALUES.
           PERFORM FIM.
           STOP RUN.

       INICIO.
           OPEN INPUT  ARQMOV
                       CADANT
                OUTPUT CADATU.
           PERFORM LER-MVTO.
           PERFORM LER-ANT.

       LER-MVTO.
           READ ARQMOV
                AT END
                MOVE HIGH-VALUES TO CH-MVTO.

           IF CH-MVTO NOT EQUAL HIGH-VALUES
               MOVE CC-MOV TO CH-MVTO.

       LER-ANT.
           READ CADANT
                AT END
                MOVE HIGH-VALUES TO CH-ANT.

           IF CH-ANT NOT EQUAL HIGH-VALUES
               MOVE CC-ANT TO CH-ANT.

       PRINCIPAL.
           IF CH-MVTO GREATER CH-ANT
               PERFORM MVTO-MENOR
           ELSE
               PERFORM ANT-MENOR.

       IGUAL.
           PERFORM GRAVA-MVTO.
           PERFORM GRAVA-ANT.
           PERFORM LER-MVTO.
           PERFORM LER-ANT.

       MVTO-MENOR.
           PERFORM GRAVA-MVTO.
           PERFORM LER-MVTO.

       ANT-MENOR.
           PERFORM GRAVA-ANT.
           PERFORM LER-ANT.

       GRAVA-ANT.
           MOVE CC-ANT    TO CC-ATU.
           MOVE TIPO-ANT  TO TIPO-ATU.
           MOVE ENDER-ANT TO ENDER-ATU.
           WRITE REG-ATU.

       GRAVA-MVTO.
           MOVE CC-MOV    TO CC-ATU.
           MOVE TIPO-MOV  TO TIPO-ATU.
           MOVE ENDER-MOV TO ENDER-ATU.
           WRITE REG-ATU.

       FIM.
           CLOSE ARQMOV
                 CADANT
                 CADATU.