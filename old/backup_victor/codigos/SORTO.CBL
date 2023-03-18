       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PGMP1.
       AUTHOR.      FATEC.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.    PC.
       OBJECT-COMPUTER.    PC.
       SPECIAL-NAMES.
               DECIMAL-POINT  IS  COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT   PEDIDOA    ASSIGN   DISK
                 ORGANIZATION IS LINE SEQUENTIAL.
            SELECT   PEDIDO1      ASSIGN   DISK
                 ORGANIZATION IS LINE SEQUENTIAL.
            SELECT   ARQSORT      ASSIGN   DISK.
       DATA DIVISION.
       FILE SECTION.
       FD  PEDIDOA
             LABEL RECORDS STANDARD
             VALUE  OF  FILE-ID   IS  "PEDIDOA.DAT".
       01  REGPEDIDOA.
             05  NUMPEDA         PIC X(06).
             05  DESCPEDA       PIC X(20).
       FD  PEDIDO1
             LABEL RECORDS STANDARD
             VALUE  OF  FILE-ID   IS  "PEDIDO1.DAT".
       01  REGPEDIDO1.
             05  NUMPED1         PIC X(06).
             05  DESCPED1       PIC X(20).
       SD  ARQSORT.
       01  REGSORT.
             05  NUMS                PIC X(06).
             05  NUMSORT  REDEFINES  NUMS   PIC 9(06).
             05  DESCSORT       PIC X(20).
       WORKING-STORAGE   SECTION.
       77    FIM                           PIC X     VALUE  SPACES.
       PROCEDURE DIVISION.
       ROTINA-PRINCIPAL.
           SORT   ARQSORT   ASCENDING   KEY   NUMSORT
                          USING    PEDIDOA
                          OUTPUT     PROCEDURE    ROTINA.
           STOP   RUN.
       ROTINA.
           OPEN     OUTPUT      PEDIDO1.
           PERFORM LEITURA.
           PERFORM    SELECIONA    UNTIL    FIM   EQUAL   "*".
           CLOSE    PEDIDO1.
       LEITURA.
           RETURN      ARQSORT    AT   END    MOVE    "*"    TO     FIM.
       SELECIONA.
           IF  (NUMSORT   LESS   18)
               WRITE    REGPEDIDO1     FROM    REGSORT
           ELSE
               NEXT    SENTENCE.
           PERFORM   LEITURA.

