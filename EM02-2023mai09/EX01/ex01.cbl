       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX01.
       AUTHOR. BRUNO RODRIGUES DE CARVALHO.
       INSTALLATION. FATEC-SP.
       DATE-WRITTEN. 11/03/2023.
       DATE-COMPILED. 11/03/2023.
      
       ENVIRONMENT DIVISION.
      
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
      
       INPUT-OUTPUT SECTION.
      
       FILE-CONTROL.
           SELECT CADSOC1 ASSIGN TO 'CADSOC1.DAT'
           ORGANIZATION IS LINE SEQUENTIAL.
      
           SELECT CADSOC2 ASSIGN TO 'CADSOC2.DAT'
           ORGANIZATION IS LINE SEQUENTIAL.
      
           SELECT RELSOCIO-OUT ASSIGN TO 'RELSOCIO.TXT'
           ORGANIZATION IS LINE SEQUENTIAL.
      
       DATA DIVISION.
      
       FILE SECTION.
       FD CADSOC1.
       01 REG-SOCIO.
           02 COD-PAGAMENTO1 PIC 9(02).
           02 NUMERO-SOCIO1 PIC 9(06).
           02 NOME-SOCIO1 PIC X(30).
           02 VALOR-PAGAMENTO1 PIC 9(02)V9(02).

       FD CADSOC2.
       01 REG-SOCIO-PAGO.
           02 NUMERO-SOCIO2 PIC 9(06).
           02 NOME-SOCIO2 PIC X(30).
           02 VALOR-PAGAMENTO2 PIC 9(02)V9(02).
      
       FD RELSOCIO.
       01 REL-SOCIO-REC.
           02 REL-SOCIO-LINHA PIC X(80).
      
       WORKING-STORAGE SECTION.
       01 TEMP-RELSOCIO.
           02 TEMP-REL-SOCIO-LINHA PIC X(80).
           02 WS-LINHA-DETALHE PIC X(80).
           02 WS-PAGINA PIC 9(02) VALUE 0.
           02 WS-CONTADOR PIC 9(02) VALUE 0.
           02 WS-QTDE-SOCIOS-ATRASADOS PIC 9(03) VALUE 0.
           02 WS-QTDE-SOCIOS-EM-DIA PIC 9(03) VALUE 0.
           02 WS-VALOR-TOTAL PIC 9(07)V99 VALUE 0.
           02 FIM-ARQ PIC X VALUE 'N'.
           02 TITULO1 PIC X(80) VALUE 'Relatório de Sócios Atrasados'.
           02 TITULO2 PIC X(80) VALUE 'Numero do Sócio'.  
           02 TITULO3 PIC X(80) VALUE 'Nome do Sócio'.  
           02 LINHA-VAZIA PIC X(80) VALUE ALL '-'.  
           02 LINHA-VAZIA-DETALHE PIC X(80) VALUE ALL '-'.
      
       PROCEDURE DIVISION.
   
       MAIN-LOGIC.
           OPEN INPUT CADSOC1
                OUTPUT CADSOC2
                OUTPUT RELSOCIO.
  
           WRITE REL-SOCIO-REC FROM TITULO1.
           WRITE REL-SOCIO-REC FROM TITULO2.
           WRITE REL-SOCIO-REC FROM TITULO3.
      
           PERFORM UNTIL FIM-ARQ = 'S'
               READ CADSOC1
                   AT END
                       MOVE 'S' TO FIM-ARQ(1:1)
                   NOT AT END
                       IF COD-PAGAMENTO1 = 1
                           PERFORM GRAVA-CADSOC2
                       ELSE
                           PERFORM IMPRIME-RELSOCIO
                       END-IF
                       IF WS-CONTADOR = 30
                           PERFORM IMPRIME-CABECALHO
                           MOVE 0 TO WS-CONTADOR
                       END-IF
               END-READ
           END-PERFORM.
            
           CLOSE CADSOC1
                 CADSOC2
                 RELSOCIO.
      
           STOP RUN.
      
       GRAVA-CADSOC2.
           MOVE NUMERO-SOCIO1 TO NUMERO-SOCIO2.
           MOVE NOME-SOCIO1 TO NOME-SOCIO2.
           WRITE REG-SOCIO-PAGO.
      
       IMPRIME-RELSOCIO.
           IF COD-PAGAMENTO1 = 2
              IF WS-CONTADOR = 0
                 PERFORM IMPRIME-CABECALHO
              END-IF.
      
              ADD 1 TO WS-QTDE-SOCIOS-ATRASADOS.
              COMPUTE WS-VALOR-TOTAL = WS-VALOR-TOTAL + VALOR-PAGAMENTO1.
      
              MOVE NUMERO-SOCIO1 TO WS-LINHA-DETALHE(1:6).
              MOVE NOME-SOCIO1 TO WS-LINHA-DETALHE(8:30).
              MOVE FUNCTION STRING(VALOR-PAGAMENTO1, "9(2)V9(2)") 
              TO WS-LINHA-DETALHE(60:5).

              WRITE RELSOCIO FROM WS-LINHA-DETALHE.
      
              ADD 1 TO WS-CONTADOR.
      
              IF WS-CONTADOR = 30
                 PERFORM IMPRIME-TOTAIS
                 PERFORM IMPRIME-CABECALHO
              END-IF.
      
              IF WS-QTDE-SOCIOS-ATRASADOS = 0 AND WS-CONTADOR = 0
                 WRITE REL-SOCIO-OUT FROM LINHA-VAZIA
              END-IF.
      
              IF WS-QTDE-SOCIOS-ATRASADOS = 0 AND WS-CONTADOR > 0
                 WRITE REL-SOCIO-OUT FROM LINHA-VAZIA-DETALHE
              END-IF.
           END-IF.
      
       IMPRIME-CABECALHO.
           ADD 1 TO WS-PAGINA.
           MOVE 'Relatório de Sócios Atrasados' TO WS-LINHA-DETALHE.
           WRITE RELSOCIO FROM WS-LINHA-DETALHE.
           MOVE SPACES TO WS-LINHA-DETALHE.
           MOVE 'Pagina ' TO WS-LINHA-DETALHE(1:7).
           MOVE WS-PAGINA TO WS-LINHA-DETALHE(8:2).
           WRITE TEMP-RELSOCIO FROM WS-LINHA-DETALHE.
           MOVE SPACES TO WS-LINHA-DETALHE.
           MOVE 'Numero do Sócio' TO WS-LINHA-DETALHE(1:17).
           MOVE 'Nome do Sócio' TO WS-LINHA-DETALHE(19:12).
           MOVE 'Valor do Pagamento' TO WS-LINHA-DETALHE(32:18).
           WRITE TEMP-RELSOCIO FROM WS-LINHA-DETALHE.
           MOVE SPACES TO WS-LINHA-DETALHE.
           WRITE TEMP-RELSOCIO FROM WS-LINHA-DETALHE.
           MOVE SPACES TO WS-LINHA-DETALHE.
           MOVE TEMP-REL-SOCIO-LINHA TO REL-SOCIO-LINHA.
           WRITE RELSOCIO-OUT FROM REL-SOCIO-LINHA.
       
       IMPRIME-TOTAIS.
           ADD WS-QTDE-SOCIOS-ATRASADOS TO WS-QTDE-SOCIOS-EM-DIA.
           MOVE SPACES TO WS-LINHA-DETALHE.
           WRITE RELSOCIO-OUT FROM WS-LINHA-DETALHE.
           MOVE 'Total de sócios atrasados: ' TO WS-LINHA-DETALHE(1:38).
           MOVE WS-QTDE-SOCIOS-ATRASADOS TO WS-LINHA-DETALHE(39:3).
           MOVE SPACES TO WS-LINHA-DETALHE(42:16).
           MOVE 'Valor total atrasado: R$ ' TO WS-LINHA-DETALHE(58:25).
           MOVE WS-VALOR-TOTAL TO WS-LINHA-DETALHE(84:8).
           WRITE RELSOCIO-OUT FROM WS-LINHA-DETALHE.
          