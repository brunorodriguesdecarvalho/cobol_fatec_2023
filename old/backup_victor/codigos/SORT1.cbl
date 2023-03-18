       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PGMP1.
       AUTHOR.      FATEC.
      *  ESTE PROGRAMA GERA O ARQUIVO DE NOTAS FISCAIS (NOTAS.DAT) 
      *  A PARTIR DO ARQUIVO DE PEDIDOS (PEDIDOS.DAT)
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.    PC.
       OBJECT-COMPUTER.    PC.
       SPECIAL-NAMES.
               DECIMAL-POINT  IS  COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
            SELECT   PEDIDOX    ASSIGN   DISK
                 ORGANIZATION IS LINE SEQUENTIAL.
            SELECT   PEDIDO1      ASSIGN   DISK
                 ORGANIZATION IS LINE SEQUENTIAL.
            SELECT   ARQSORT      ASSIGN   DISK.
       DATA DIVISION.
       FILE SECTION.
       FD  PEDIDOX
             LABEL RECORDS STANDARD
             VALUE  OF  FILE-ID   IS  "PEDIDOX.DAT".
       01  REGPEDIDOX.
             05  NUMPEDX         PIC X(06).
             05  DESCPEDX       PIC X(20).
       FD  PEDIDO1
             LABEL RECORDS STANDARD
             VALUE  OF  FILE-ID   IS  "PEDIDO1.DAT".
       01  REGPEDIDO1.
             05  NUMPED1         PIC X(06).
             05  DESCPED1       PIC X(20).
       SD  ARQSORT.
       01  REGSORT.
             05  NUMSORT         PIC X(06).
             05  DESCSORT       PIC X(20).
       PROCEDURE DIVISION.

       ROTINA-PRINCIPAL.
           SORT   ARQSORT   ASCENDING   KEY   NUMSORT
                          USING     PEDIDOX
                          GIVING   PEDIDO1.
          STOP   RUN.

