       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX02.
       AUTHOR. BRUNO CARVALHO.
       DATE-WRITTEN. 22/04/2023.
       DATE-COMPILED. 22/04/2023.
       INSTALLATION. BRUNO-PC.
       SECURITY. ESSE PROGRAMA SO PODE SER ALTERADO PELO AUTOR.
      *REMARKS. Ler CADCLI
      *         Imprimir RELCLI conforme lay-out.
      *         Imprimir cabeçalhos em todas as páginas.
      *         Enumerar as páginas.
      *         Imprimir no máximo 25 linhas de detalhe por página. 
      *         Deixar 2 linhas em branco entre os cabeçalhos. 
      *         Deixar uma linha em branco entre o último cabeçalho
      *         e a primeira linha de detalhe.
      *         Imprimir os registros dos clientes que visitaram a 
      *         empresa no período de 2010 a 2011.
      *         No final do processamento, imprimir o total de clientes
      *         conforme layout, deixando três linhas em branco entre a
      *         última linha de detalhe e a linha de total.


       ENVIRONMENT DIVISION. 

       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. BRUNO-PC.
       OBJECT-COMPUTER. BRUNO-PC.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL. 

           SELECT RELCLI ASSIGN TO DISK. 

       DATA DIVISION. 

       FILE SECTION.

       FD  CADCLI
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADCLI.DAT".
       01  CADCLI1.
           02 CPF-CLIENTE         PIC 9(11).
           02 NOME-CLIENTE        PIC X(30).
           02 ESTADO-CLIENTE      PIC X(02).
           02 CIDADE-CLIENTE      PIC X(30).
           02 TELEFONE-CLIENTE    PIC 9(08).
           02 DATA-VIS-CLI        PIC 9(08).

       FD  RELCLI
           LABEL RECORD IS OMITTED
           VALUE OF FILE-ID IS "RELCLI.TXT".
       01  REL-ITEM PIC X(72).
       01  REL-TOT  PIC X(72).

       WORKING-STORAGE SECTION. 
       77  FIM-ARQ PIC X(03) VALUE "NAO".
       77  CT-LIN  PIC 9(02) VALUE 25.
       77  CT-PAG  PIC 9(02) VALUE ZEROES.

       01  CAB-01.
           02 FILLER  PIC X(54) VALUE SPACES.
           02 FILLER  PIC X(05) VALUE "PAG. ".
           02 VAR-PAG PIC 99(02).
           02 FILLER  PIC X(11) VALUE SPACES.

       01  CAB-02.
           02 FILLER  PIC X(23) VALUE SPACES.
           02 FILLER  PIC X(18) VALUE "TURISMAR  TURISMOS".
           02 FILLER  PIC X(31) VALUE SPACES.

       01  CAB-03.
           02 FILLER PIC X(14) VALUE SPACES.
           02 FILLER PIC X(24) VALUE "CLIENTES NO PERIODO DE: ".
           02 FILLER PIC X(12) VALUE " 2010 A 2011".
           02 FILLER PIC X(18) VALUE SPACES.

       01  CAB-04.
           02 FILLER PIC X(4) VALUE SPACES.
           02 FILLER PIC X(8) VALUE "  NOME  ".
           02 FILLER PIC X(20) VALUE SPACES.
           02 FILLER PIC X(8) VALUE " ESTADO ".
           02 FILLER PIC X(12) VALUE SPACES.
           02 FILLER PIC X(8) VALUE "TELEFONE".
           02 FILLER PIC X(12) VALUE SPACES.

       01  CAB-05.
           02 FILLER PIC X(31) VALUE "-------------------------------".
           02 FILLER PIC X(31) VALUE "-------------------------------".

       01  DETALHE.
           02 FILLER      PIC X(02) VALUE SPACES.
           02 NOME        PIC X(30).
           02 FILLER      PIC X(03) VALUE SPACES.
           02 ESTADO      PIC X(02).
           02 FILLER      PIC X(15) VALUE SPACES.
           02 TELEFONE-P1 PIC 9(04).
           02 FILLER      PIC X(1) VALUE "-".
           02 TELEFONE-P2 PIC 9(04).
           02 FILLER      PIC X(01) VALUE SPACES.

       01  TOTAL-CLIENTES.
           02 FILLER PIC X(19) VALUE "Total de Clientes: ".
           02 QTD-CLIENTES PIC 9(04) VALUE ZEROES.
             
       PROCEDURE DIVISION. 

       MAIN.
           PERFORM INICIO.
           PERFORM PRINCIPAL UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM FIM.
           STOP RUN.

       INICIO.
           OPEN INPUT  CADCLI
                OUTPUT RELCLI.
           PERFORM LEITURA.

       LEITURA.
           READ CADCLI AT END MOVE "SIM" TO FIM-ARQ.
       
       CABECALHO.
           ADD 1         TO CT-PAG.
           MOVE CT-PAG   TO VAR-PAG.
           MOVE SPACES   TO REL-ITEM.

           IF CT-PAG = 1
               WRITE REL-ITEM FROM CAB-01
           ELSE WRITE REL-ITEM FROM CAB-01 AFTER ADVANCING 4 LINE.
           WRITE REL-ITEM FROM CAB-02 AFTER ADVANCING 1 LINE.
           WRITE REL-ITEM FROM CAB-03 AFTER ADVANCING 3 LINE.
           WRITE REL-ITEM FROM CAB-04 AFTER ADVANCING 3 LINE.
           WRITE REL-ITEM FROM CAB-05 AFTER ADVANCING 1 LINE.

           MOVE ZEROES   TO CT-LIN.

       IMPRESSAO.
           IF CT-LIN EQUAL 25
               PERFORM CABECALHO.

           MOVE NOME-CLIENTE            TO NOME.
           MOVE ESTADO-CLIENTE          TO ESTADO.
           MOVE TELEFONE-CLIENTE(1:4)   TO TELEFONE-P1.
           MOVE TELEFONE-CLIENTE(5:8)   TO TELEFONE-P2.
           ADD 1                        TO CT-LIN.

           IF CT-LIN EQUAL 1
               WRITE REL-ITEM FROM DETALHE AFTER ADVANCING 2 LINE
           ELSE WRITE REL-ITEM FROM DETALHE AFTER ADVANCING 1 LINE.

       PRINCIPAL.
           IF DATA-VIS-CLI(5:8)=2010 OR DATA-VIS-CLI(5:8) = 2011 
              ADD 1 TO QTD-CLIENTES
              PERFORM IMPRESSAO.
           PERFORM LEITURA.
           
       FIM.
           WRITE REL-TOT FROM TOTAL-CLIENTES AFTER ADVANCING 4 LINE.
           CLOSE CADCLI RELCLI.