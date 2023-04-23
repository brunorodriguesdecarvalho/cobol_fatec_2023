       IDENTIFICATION DIVISION. 
       PROGRAM-ID. EX01.
       AUTHOR. BRUNO CARVALHO.
       INSTALLATION. BRUNO-PC.
       DATE-WRITTEN. 21/04/2023.
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
           SELECT CADSOC1 ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT REL-ATR ASSIGN TO DISK.

           SELECT CADSOC2 ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION. 
       FILE SECTION. 

       FD  CADSOC1
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADSOC1.DAT".
       01  CAD-SOC1.
           02 CODIGO-PAGAMENTO1 PIC 9(02).
           02 NUMERO-SOCIO1     PIC 9(06).
           02 NOME-SOCIO1       PIC X(30).
           02 VALOR-PAGAMENTO1  PIC 9(09)V9(02).

       FD  REL-ATR
           LABEL RECORD IS OMITTED
           VALUE OF FILE-ID IS "RELSOCIO.txt".
       01  REG-ATR    PIC X(80).
       01  QTD-ATRAS  PIC X(80).
       01  SUM-ATRAS  PIC X(80).

       FD  CADSOC2
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADSOC2.DAT".
       01  CAD-SOC2.
           02 NUMERO-SOCIO2     PIC 9(06).
           02 NOME-SOCIO2       PIC X(30).
           02 VALOR-PAGAMENTO2  PIC 9(09)V9(02).

       WORKING-STORAGE SECTION.
       77  FIM-ARQ         PIC X(03) VALUE "NAO".
       77  CT-LIN          PIC 9(02) VALUE 30.
       77  CT-PAG          PIC 9(02) VALUE ZEROES.
       77  TEMP-VAL-ATR    PIC 9(12)V9(06) VALUE ZEROES.

       01 CAB-01.
           02 FILLER  PIC X(65) VALUE SPACES.
           02 FILLER  PIC X(05) VALUE "PAG. ".
           02 VAR-PAG PIC 99.
           02 FILLER  PIC X(03) VALUE SPACES.

       01 CAB-02. 
           02 FILLER  PIC X(21) VALUE SPACES. 
           02 FILLER  PIC X(30) VALUE "RELATORIO DE SOCIOS ATRASADOS ". 
           02 FILLER  PIC X(21) VALUE SPACES.

       01 CAB-03. 
           02 FILLER  PIC X(15) VALUE "NUMERO DO SOCIO". 
           02 FILLER  PIC X(10)  VALUE SPACES. 
           02 FILLER  PIC X(15) VALUE "NOME DO SOCIO". 
           02 FILLER  PIC X(14) VALUE SPACES. 
           02 FILLER  PIC X(18) VALUE "VALOR DO PAGAMENTO". 

       01 DETALHE.
           02 FILLER  PIC X(03) VALUE SPACES.
           02 NUM-SOC PIC Z999.999.
           02 FILLER  PIC X(13) VALUE SPACES.
           02 NOM-SOC PIC X(30).
           02 VAL-PAG PIC Z999.999.999,99.

       01 QTD-ATRASOS. 
           02 FILLER PIC X(28) VALUE "Total de Socios atrasados : ". 
           02 SOC-QTD-ATRAS PIC 9(05).
           02 FILLER  PIC X(49) VALUE SPACES.

       01 SUM-ATRASOS. 
           02 FILLER PIC X(30) VALUE "Valor Total atrasado      : R$". 
           02 SOC-SUM-ATRAS PIC Z999.999.999.999,99.
           02 FILLER  PIC X(28) VALUE SPACES.
          
       PROCEDURE DIVISION.

       EXEMPLO-IMPRESSAO.
           PERFORM INICIO.
           PERFORM PRINCIPAL UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM IMPRESSAO-FINAL.
           PERFORM FIM.
           STOP RUN.

       INICIO.
           OPEN INPUT CADSOC1
                OUTPUT CADSOC2 REL-ATR.
           PERFORM LEITURA.

       LEITURA.
           READ CADSOC1 AT END MOVE "SIM" TO FIM-ARQ.

       PRINCIPAL.
           IF CODIGO-PAGAMENTO1 = 02
              PERFORM IMPRESSAO.
           IF CODIGO-PAGAMENTO1 = 01
              PERFORM GRAVACAO.
           PERFORM LEITURA.

       CABECALHO.
           ADD 1        TO CT-PAG.
           MOVE CT-PAG  TO VAR-PAG.
           MOVE SPACES  TO REG-ATR.
           WRITE REG-ATR FROM CAB-01 AFTER ADVANCING 2 LINE.
           WRITE REG-ATR FROM CAB-02 AFTER ADVANCING 3 LINE.
           WRITE REG-ATR FROM CAB-03 AFTER ADVANCING 2 LINE.
           MOVE ZEROES  TO CT-LIN.


       IMPRESSAO.
           IF CT-LIN EQUAL 30
              PERFORM CABECALHO.

           MOVE NUMERO-SOCIO1 TO NUM-SOC.
           MOVE NOME-SOCIO1 TO NOM-SOC.
           MOVE VALOR-PAGAMENTO1 TO VAL-PAG.
           
           ADD 1 TO CT-LIN.
           ADD 1 TO SOC-QTD-ATRAS.
           ADD VALOR-PAGAMENTO1 TO TEMP-VAL-ATR.

           IF CT-LIN EQUAL 1              
              WRITE REG-ATR FROM DETALHE AFTER ADVANCING 2 LINE
              ELSE WRITE REG-ATR FROM DETALHE AFTER ADVANCING 1 LINE.
           
       GRAVACAO.
           MOVE NUMERO-SOCIO1 TO NUMERO-SOCIO2
           MOVE NOME-SOCIO1 TO NOME-SOCIO2
           MOVE VALOR-PAGAMENTO1 TO VALOR-PAGAMENTO2
           WRITE CAD-SOC2.

       IMPRESSAO-FINAL.        
           WRITE QTD-ATRAS FROM QTD-ATRASOS AFTER ADVANCING 2 LINE.
           MOVE TEMP-VAL-ATR TO SOC-SUM-ATRAS.
           WRITE SUM-ATRAS FROM SUM-ATRASOS AFTER ADVANCING 1 LINE.

       FIM.
           CLOSE CADSOC1 REL-ATR CADSOC2.



     
       