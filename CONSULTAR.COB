      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Consultar informacoes de filmes cadastrados
      *=================================================================

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONSULTAR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-BUFF                PIC X(30).
       77  WRK-LINE                PIC 9(01).
       77  WRK-MOV-COD-MSK         PIC X(04) JUSTIFIED RIGHT.
       77  WRK-MOV-GRADE-MSK       PIC X(02) JUSTIFIED RIGHT.
       77  WRK-MOV-LEN-MSK         PIC X(03) JUSTIFIED RIGHT.
       77  WRK-TECLA               PIC X(01).
       77  WRK-STATUS              PIC 9(03) VALUE ZEROES.

       01  WRK-AREA.
           05 WRK-MENU-TITLE       PIC X(30).
           05 WRK-MENU-ITEM        PIC X(30) OCCURS 7 TIMES.
           05 WRK-MENU-SIZE        PIC 9(01).

       01  WRK-MOVIE.
           05 WRK-MOV-COD          PIC 9(05) VALUE ZEROES.
           05 WRK-MOV-TITLE        PIC X(30) VALUE SPACES.
           05 WRK-MOV-GENRE        PIC X(08) VALUE SPACES.
           05 WRK-MOV-LEN          PIC 9(03) VALUE ZEROES.
           05 WRK-MOV-PUBLI        PIC X(15) VALUE SPACES.
           05 WRK-MOV-GRADE        PIC 9(02) VALUE ZEROES.

       LINKAGE SECTION.
       77  LNK-BUFF PIC X(1) VALUE SPACES.

       SCREEN  SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  SHOW-MV.
           05 SHOW-SCREEN.
               10 LINE 03 COLUMN 01 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 2 FROM "FILME".
           05 DTA.
               10 LINE WRK-LINE COLUMN 05 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 FROM WRK-BUFF.

       PROCEDURE DIVISION USING LNK-BUFF.
       0000-MAIN-PROCEDURE.
           PERFORM 0010-ZERO-INFO.
           PERFORM 0020-DRAW-MENU.
           PERFORM 0030-GET-INFO.
           PERFORM 0040-SEARCH-MOVIE.
           IF WRK-STATUS EQUAL ZEROES
               PERFORM 0050-SHOW-MOVIE
           END-IF.
           GOBACK.

      *=================================================================
       0010-ZERO-INFO      SECTION.
      *=================================================================
           MOVE ZEROES TO WRK-STATUS.

           MOVE SPACES TO WRK-MOV-COD-MSK.
           MOVE SPACES TO WRK-MOV-LEN-MSK.
           MOVE SPACES TO WRK-MOV-GRADE-MSK.

           MOVE ZEROES TO WRK-MOV-COD.
           MOVE SPACES TO WRK-MOV-TITLE.
           MOVE SPACES TO WRK-MOV-GENRE.
           MOVE ZEROES TO WRK-MOV-LEN.
           MOVE SPACES TO WRK-MOV-PUBLI.
           MOVE ZEROES TO WRK-MOV-GRADE.
      *=================================================================
       0020-DRAW-MENU      SECTION.
      *=================================================================
           MOVE "CONSULTA" TO WRK-MENU-TITLE.
           MOVE "CODIGO: " TO WRK-MENU-ITEM(01).
           MOVE 1 TO WRK-MENU-SIZE.
           CALL "MENUS" USING WRK-AREA.
           DISPLAY "PRESSIONE ENTER PARA VOLTAR" AT 1005.

      *=================================================================
       0030-GET-INFO      SECTION.
      *=================================================================
           ACCEPT WRK-MOV-COD-MSK AT 0320.
           IF WRK-MOV-COD-MSK EQUAL SPACES
               GOBACK
           END-IF.

      *=================================================================
       0040-SEARCH-MOVIE      SECTION.
      *=================================================================
           MOVE WRK-MOV-COD-MSK TO WRK-MOV-COD.
           CALL "SEARCHMOVIE" USING WRK-MOVIE,WRK-STATUS.

      *=================================================================
       0050-SHOW-MOVIE      SECTION.
      *=================================================================
           DISPLAY CLEAR-SCREEN.
           DISPLAY SHOW-SCREEN.

           MOVE SPACES TO WRK-BUFF.
           MOVE 04 TO WRK-LINE.

           STRING "CODIGO: " WRK-MOV-COD INTO WRK-BUFF.
           DISPLAY DTA.

           MOVE SPACES TO WRK-BUFF.
           MOVE 05 TO WRK-LINE.
           STRING "TITULO: " WRK-MOV-TITLE INTO WRK-BUFF.
           DISPLAY DTA.

           MOVE SPACES TO WRK-BUFF.
           MOVE 06 TO WRK-LINE.
           STRING "GENERO: " WRK-MOV-GENRE INTO WRK-BUFF.
           DISPLAY DTA.

           MOVE SPACES TO WRK-BUFF.
           MOVE 07 TO WRK-LINE.
           STRING "DURACAO: " WRK-MOV-LEN INTO WRK-BUFF.
           DISPLAY DTA.

           MOVE SPACES TO WRK-BUFF.
           MOVE 08 TO WRK-LINE.
           STRING "DISTRIBUIDORA: " WRK-MOV-PUBLI INTO WRK-BUFF.
           DISPLAY DTA.

           MOVE SPACES TO WRK-BUFF.
           MOVE 09 TO WRK-LINE.
           STRING "NOTA: " WRK-MOV-GRADE INTO WRK-BUFF.
           DISPLAY DTA.

           DISPLAY "PRESSIONE ENTER PARA VOLTAR" AT 1105.
           ACCEPT WRK-TECLA.

       END PROGRAM CONSULTAR.
