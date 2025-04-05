      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Este programa tem a finalidade de gerenciar os
      *           dados de um catálogo de filmes através de um menu de opções :
      *           Cadastro, Consulta, Alteração, Exclusão e Relação
      *=================================================================

       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILMES.
       DATA DIVISION.
       FILE                    SECTION.
       WORKING-STORAGE         SECTION.
       77  WRK-INVALID-OPTN        PIC 9(01) VALUE ZEROES.
       77  WRK-SELECTED            PIC X(01).
       01  WRK-AREA.
           05 WRK-MENU-TITLE       PIC X(30).
           05 WRK-MENU-ITEM        PIC X(30) OCCURS 7 TIMES.
           05 WRK-MENU-SIZE        PIC 9(1).
       SCREEN  SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  SHOW-MV.
           05 SHOW-SCREEN.
               10 LINE 01 COLUMN 01 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 2 FROM "FILMES".
       PROCEDURE DIVISION.
       0000-MAIN-PROCEDURE.
           PERFORM 0010-DRAW-MM.
           MOVE 0 TO WRK-INVALID-OPTN
           EVALUATE WRK-SELECTED
               WHEN 1
                   CALL "CADASTRAR"
                   PERFORM 0000-MAIN-PROCEDURE
               WHEN 2
                   CALL "CONSULTAR"
                   PERFORM 0000-MAIN-PROCEDURE
               WHEN 3
                   CALL "ALTERAR"
                   PERFORM 0000-MAIN-PROCEDURE
               WHEN 4
                   CALL "EXCLUIR"
                   PERFORM 0000-MAIN-PROCEDURE
               WHEN 5
                   CALL "RELATORIO"
                   PERFORM 0000-MAIN-PROCEDURE
               WHEN OTHER
                   PERFORM 0020-GET-TECLA
           END-EVALUATE.

           STOP RUN.

      *=================================================================
       0010-DRAW-MM            SECTION.
      *Desenha o menu principal
      *=================================================================
           DISPLAY CLEAR-SCREEN
           MOVE "MENU PRINCIPAL"   TO WRK-MENU-TITLE.
           MOVE "1-CADASTRO"       TO WRK-MENU-ITEM(01).
           MOVE "2-CONSULTA"       TO WRK-MENU-ITEM(02).
           MOVE "3-ALTERACAO"      TO WRK-MENU-ITEM(03).
           MOVE "4-EXCLUSAO"       TO WRK-MENU-ITEM(04).
           MOVE "5-RELACAO"        TO WRK-MENU-ITEM(05).
           MOVE "X-SAIR"           TO WRK-MENU-ITEM(06).
           MOVE 6                  TO WRK-MENU-SIZE.

           CALL "MENUS" USING WRK-AREA.
           IF WRK-INVALID-OPTN NOT EQUAL TO ZEROES
               DISPLAY "A OPCAO DIGITADA E INVALIDA" AT 1105.
           DISPLAY "SELECIONE UMA OPCAO: " AT 1205.
           ACCEPT WRK-SELECTED AT 1226.

      *=================================================================
       0020-GET-TECLA            SECTION.
      *=================================================================
       IF  WRK-SELECTED NOT EQUAL TO 'X' AND
           WRK-SELECTED NOT EQUAL TO 'x'
           MOVE 1 TO WRK-INVALID-OPTN
           PERFORM 0000-MAIN-PROCEDURE
       ELSE
           CONTINUE
       END-IF.

       END PROGRAM FILMES.
