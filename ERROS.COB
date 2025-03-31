      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Recebe um codigo e mostra uma
      * tela mostrando o que esta errado
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ERROS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-MSG              PIC X(62).
       77  WRK-BUFF             PIC X(70).
       LINKAGE SECTION.
       77 LNK-STATUS        PIC 9(03).
       SCREEN  SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  WARNING.
           05 WARNING-SCREEN.
               10 LINE 05 COLUMN 09 PIC X(70) ERASE EOL
                  BACKGROUND-COLOR 4 FOREGROUND-COLOR 7
                  FROM WRK-BUFF.
               10 LINE 06 COLUMN 09 PIC X(27) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 7
                  FROM "PRESSIONE ENTER PARA VOLTAR".

       PROCEDURE DIVISION USING LNK-STATUS.
       MAIN-PROCEDURE.
           MOVE SPACES TO WRK-MSG.
           MOVE SPACES TO WRK-BUFF
           EVALUATE LNK-STATUS
               WHEN 220
                   MOVE "CODIGO DUPLICADO - FILME NAO CADASTRADO"
                   TO WRK-MSG
               WHEN 350
                   MOVE "ARQUIVO DE REGISTRO NAO ENCONTRADO"
                   TO WRK-MSG
               WHEN 420
                   GOBACK
               WHEN 480
                   STRING "ARQUIVO DE REGISTRO NAO PODE SER CRIADO "
                   "OU ACESSADO" INTO WRK-MSG
               WHEN 601
                   STRING "CODIGO INSERIDO E INVALIDO (0001->9999)"
                   " - FILME NAO CADASTRADO"
                   INTO WRK-MSG
               WHEN 602
                   STRING "DURACAO INSERIDA E INVALIDA (000->999)"
                   " - FILME NAO CADASTRADO"
                   INTO WRK-MSG
               WHEN 603
                   STRING "NOTA INSERIDA E INVALIDA (00->99)"
                   " - FILME NAO CADASTRADO"
                   INTO WRK-MSG
               WHEN 604
                   STRING "TITULO NAO PODE SER VAZIO"
                   " - FILME NAO CADASTRADO"
                   INTO WRK-MSG
               WHEN 605
                   STRING "GENERO NAO PODE SER VAZIO"
                   " - FILME NAO CADASTRADO"
                   INTO WRK-MSG
               WHEN 606
                   STRING "DISTRIBUIDORA NAO PODE SER VAZIO"
                   " - FILME NAO CADASTRADO"
                   INTO WRK-MSG
               WHEN 607
                   MOVE "FILME NAO ENCONTRADO"
                   TO WRK-MSG
               WHEN 608
                   MOVE "REGISTRO NAO ALTERADO" TO WRK-MSG
               WHEN OTHER
                   MOVE LNK-STATUS TO WRK-MSG
           END-EVALUATE
           PERFORM 0010-DRAW-ERR-SCRN
           GOBACK.

      *=================================================================
       0010-DRAW-ERR-SCRN       SECTION.
      *Desenha a tela de erros
      *=================================================================
           STRING "ERRO: " WRK-MSG INTO WRK-BUFF.
           DISPLAY CLEAR.
           DISPLAY WARNING-SCREEN.
           ACCEPT WRK-BUFF.
       END PROGRAM ERROS.
