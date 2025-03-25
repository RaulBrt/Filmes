      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Menu principal da aplicação
      *=================================================================

       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENUPRINCIPAL.
       DATA DIVISION.
       FILE                    SECTION.
       WORKING-STORAGE         SECTION.

       77  WRK-SELECTED         PIC X(1).
       01  WRK-AREA.
           05 WRK-MENU-TITLE       PIC X(30).
           05 WRK-MENU-ITEM        PIC X(30) OCCURS 7 TIMES.
           05 WRK-MENU-SIZE        PIC 9(1).
       LINKAGE SECTION.
       77  LNK-BUFF            PIC X(1).
       PROCEDURE DIVISION USING LNK-BUFF.
       0000-MAIN-PROCEDURE.
           PERFORM 0010-DRAW-MM.
           EVALUATE WRK-SELECTED
               WHEN 1
                   CALL "CADASTRAR"
               WHEN OTHER
                   PERFORM 0000-MAIN-PROCEDURE
           END-EVALUATE.
           STOP RUN.

      *=================================================================
       0010-DRAW-MM            SECTION.
      *=================================================================
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

       END PROGRAM MENUPRINCIPAL.
