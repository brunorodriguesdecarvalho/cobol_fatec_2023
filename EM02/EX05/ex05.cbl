       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX05.
       AUTHOR. BRUNO CARVALHO.
       INSTALLATION.  BRUNO-PC.
       DATE-WRITTEN.  22/04/2023.
       DATE-COMPILED. 22/04/2023.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS.    LER REGISTROS E IMPRIMIR RELATORIO.

       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. BRUNO-PC.
       OBJECT-COMPUTER. BRUNO-PC.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT ARQALU ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT RELAPROV ASSIGN TO DISK.

           SELECT ARQREP ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION. 
       FILE SECTION. 

       FD  ARQALU
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "ARQALU.DAT".
       01  REG-ALU.
           02 MATRICULA-ALU   PIC 9(07).
           02 NOME-ALU        PIC X(30).
           02 NOTA1-ALU       PIC 9(02)V9(02).
           02 NOTA2-ALU       PIC 9(02)V9(02).
           02 NOTA3-ALU       PIC 9(02)V9(02).
           02 FALTAS-ALU      PIC 9(02).
           02 SEXO-ALU        PIC X(01).

       FD  RELAPROV
           LABEL RECORD IS OMITTED
           VALUE OF FILE-ID IS "RELAPROV.txt".
       01  REG-APROV    PIC X(80).
       01  QTD-APROV    PIC X(80).
       01  MEDIA-TURMA  PIC X(80).

       FD  ARQREP
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "ARQREP.DAT".
       01  REG-REP.
           02 MATRICULA-REPROV   PIC 9(07).
           02 NOME-REPROV        PIC X(30).
           02 NOTA1-REPROV       PIC 9(02)V9(02).
           02 NOTA2-REPROV       PIC 9(02)V9(02).
           02 NOTA3-REPROV       PIC 9(02)V9(02).
           02 FALTAS-REPROV      PIC 9(02).
           02 SEXO-REPROV        PIC X(01).

       WORKING-STORAGE SECTION.
       77  FIM-ARQ           PIC X(03) VALUE "NAO".
       77  CT-LIN            PIC 9(02) VALUE 30.
       77  CT-PAG            PIC 9(02) VALUE ZEROES.
       77  TEMP-SOMA-ALU     PIC 9(04)V9(04) VALUE ZEROES.
       77  TEMP-MED-ALUNO    PIC 9(02)V9(02) VALUE ZEROES.
       77  TEMP-APROVADOS    PIC 9(05) VALUE ZEROES.
       77  TEMP-MEDIA-TOT    PIC 9(08)V9(08) VALUE ZEROES.
       77  TEMP-MEDIA-TURMA  PIC 9(08)V9(08) VALUE ZEROES.

       01  CAB-01.
           02 FILLER  PIC X(10) VALUE SPACES. 
           02 FILLER  PIC X(30) VALUE "RELATORIO DE ALUNOS APROVADOS ". 
           02 FILLER  PIC X(10) VALUE SPACES.
           02 FILLER  PIC X(05) VALUE "PAG. ".
           02 VAR-PAG PIC Z9.
           02 FILLER  PIC X(03) VALUE SPACES.

       01  CAB-02. 
           02 FILLER  PIC X(06) VALUE "NUMERO". 
           02 FILLER  PIC X(06) VALUE SPACES. 
           02 FILLER  PIC X(13) VALUE "NOME DO ALUNO". 
           02 FILLER  PIC X(17) VALUE SPACES. 
           02 FILLER  PIC X(05) VALUE "MEDIA". 
           02 FILLER  PIC X(04) VALUE SPACES.
           02 FILLER  PIC X(06) VALUE "FALTAS". 

       01  DETALHE.
           02 NUMERO      PIC 9(07).
           02 FILLER      PIC X(04) VALUE SPACES.
           02 NOME        PIC X(30).
           02 FILLER      PIC X(01) VALUE SPACES.
           02 MEDIA       PIC Z9,99.
           02 FILLER      PIC X(06) VALUE SPACES.
           02 FALTA       PIC 9(02).

       01  TOT-APROVADOS. 
           02 FILLER PIC X(27) VALUE "Total de alunos aprovados: ". 
           02 TOTAL-APROVADOS PIC 9(05).
       
       01  MED-APROVADOS. 
           02 FILLER PIC X(20) VALUE "Media geral da turma".
           02 FILLER PIC X(07) VALUE "     : ".
           02 MEDIA-APROVADOS PIC Z9,99.
          
       PROCEDURE DIVISION.

       EXEMPLO-IMPRESSAO.
           PERFORM INICIO.
           PERFORM PRINCIPAL UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM IMPRESSAO-FINAL.
           PERFORM FIM.
           STOP RUN.

       INICIO.
           OPEN INPUT ARQALU
                OUTPUT ARQREP RELAPROV.
           PERFORM LEITURA.

       LEITURA.
           READ ARQALU AT END MOVE "SIM" TO FIM-ARQ.
       
       CALCMEDIA.
           MOVE ZEROES   TO TEMP-SOMA-ALU.
           MOVE ZEROES   TO TEMP-MED-ALUNO.
           
           ADD NOTA1-ALU TO TEMP-SOMA-ALU.
           ADD NOTA2-ALU TO TEMP-SOMA-ALU.
           ADD NOTA3-ALU TO TEMP-SOMA-ALU.

           DIVIDE TEMP-SOMA-ALU BY 3 
              GIVING TEMP-MED-ALUNO.

       DECISAO.
           PERFORM CALCMEDIA.
           IF TEMP-MED-ALUNO GREATER OR EQUAL 7 AND
              FALTAS-ALU < 16
              PERFORM IMPRESSAO
           ELSE PERFORM GRAVACAO.

       PRINCIPAL.
           PERFORM DECISAO.
           PERFORM LEITURA.

       CABECALHO.
           ADD 1           TO CT-PAG.
           MOVE CT-PAG     TO VAR-PAG.
           MOVE SPACES     TO REG-APROV.

           IF CT-PAG = 1
              WRITE REG-APROV FROM CAB-01
           ELSE WRITE REG-APROV FROM CAB-01 AFTER ADVANCING 4 LINE.
           WRITE REG-APROV FROM CAB-02 AFTER ADVANCING 2 LINE.
           MOVE ZEROES     TO CT-LIN.

       IMPRESSAO.
           IF CT-LIN EQUAL 30
              PERFORM CABECALHO.

           MOVE MATRICULA-ALU     TO NUMERO
           MOVE NOME-ALU          TO NOME
           MOVE TEMP-MED-ALUNO    TO MEDIA
           ADD  TEMP-MED-ALUNO    TO TEMP-MEDIA-TOT
           MOVE FALTAS-ALU        TO FALTA
           
           ADD 1 TO CT-LIN.
           ADD 1 TO TEMP-APROVADOS.

           IF CT-LIN EQUAL 1              
              WRITE REG-APROV FROM DETALHE AFTER ADVANCING 2 LINE
              ELSE WRITE REG-APROV FROM DETALHE AFTER ADVANCING 1 LINE.
           
       GRAVACAO.
           MOVE MATRICULA-ALU TO MATRICULA-REPROV
           MOVE NOME-ALU      TO NOME-REPROV
           MOVE NOTA1-ALU     TO NOTA1-REPROV
           MOVE NOTA2-ALU     TO NOTA2-REPROV
           MOVE NOTA3-ALU     TO NOTA3-REPROV
           MOVE FALTAS-ALU    TO FALTAS-REPROV
           MOVE SEXO-ALU      TO SEXO-REPROV
           WRITE REG-REP.

       IMPRESSAO-FINAL.        
           MOVE TEMP-APROVADOS TO TOTAL-APROVADOS
           WRITE QTD-APROV FROM TOT-APROVADOS 
              AFTER ADVANCING 4 LINE.

           DIVIDE TEMP-MEDIA-TOT BY TEMP-APROVADOS
              GIVING TEMP-MEDIA-TURMA.   

           MOVE TEMP-MEDIA-TURMA TO MEDIA-APROVADOS
           WRITE MEDIA-TURMA FROM MED-APROVADOS
              AFTER ADVANCING 1 LINE.
           
       FIM.
           CLOSE ARQALU RELAPROV ARQREP.



     
       