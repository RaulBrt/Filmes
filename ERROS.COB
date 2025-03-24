      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Lidar com erros
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ERROS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-MSG              PIC X(50).
       77  WRK-BUFF             PIC X(1).
       LINKAGE SECTION.
       01  LNK-ERROR.
           05 LNK-MSG           PIC X(40).
           05 LNK-STATUS        PIC 9(03).
       SCREEN  SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  WARNING.
           05 WARNING-SCREEN.
               10 LINE 05 COLUMN 09 PIC X(50) ERASE EOL
                  BACKGROUND-COLOR 4 FOREGROUND-COLOR 7
                  FROM WRK-MSG.
               10 LINE 06 COLUMN 09 PIC X(50) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 7
                  FROM "PRESSIONE QUALQUER TECLA PARA VOLTAR".

       PROCEDURE DIVISION USING LNK-ERROR.
       MAIN-PROCEDURE.
           EVALUATE LNK-STATUS
               WHEN 600
                   PERFORM 0010-DRAW-ERR-SCRN.
                   GOBACK.

      *=================================================================
       0010-DRAW-ERR-SCRN       SECTION.
      *=================================================================
           STRING "ERRO: " LNK-MSG INTO WRK-MSG.
           DISPLAY CLEAR.
           DISPLAY WARNING-SCREEN.
           ACCEPT WRK-BUFF.
       END PROGRAM ERROS.
