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

       77  WRK-SELECTED         PIC X(1).
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
           EVALUATE WRK-SELECTED
               WHEN 1
                   CALL "CADASTRAR"
               WHEN 2
                   CALL "CONSULTAR"
               WHEN 3
                   CALL "ALTERAR"
               WHEN 4
                   CALL "EXCLUIR"
               WHEN 5
                   CALL "RELATORIO"
               WHEN OTHER
                   CONTINUE
           END-EVALUATE.
           IF WRK-SELECTED NOT EQUAL TO 'X'
               PERFORM 0000-MAIN-PROCEDURE.
           STOP RUN.

      *=================================================================
       0010-DRAW-MM            SECTION.
      *Desenha o menu principal
      *=================================================================
           DISPLAY CLEAR-SCREEN
           MOVE "MENU PRINCIPAL" TO WRK-MENU-TITLE.
           MOVE "1-CADASTRO" TO WRK-MENU-ITEM(01).
           MOVE "2-CONSULTA" TO WRK-MENU-ITEM(02).
           MOVE "3-ALTERACAO" TO WRK-MENU-ITEM(03).
           MOVE "4-EXCLUSAO" TO WRK-MENU-ITEM(04).
           MOVE "5-RELACAO" TO WRK-MENU-ITEM(05).
           MOVE "X-SAIR" TO WRK-MENU-ITEM(06).
           MOVE 6 TO WRK-MENU-SIZE.

           CALL "MENUS" USING WRK-AREA.
           DISPLAY "SELECIONE UMA OPCAO: " AT 1205.
           ACCEPT WRK-SELECTED AT 1226.

       END PROGRAM FILMES.
