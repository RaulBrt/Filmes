      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 27/MAR/2025
      * Objetivo: Alterar informacoes de filmes cadastrados
      *=================================================================

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALTERAR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-BUFF                PIC X(30).
       77  WRK-LINE                PIC 9(02).
       77  WRK-MOV-COD-MSK         PIC X(04) JUSTIFIED RIGHT.
       77  WRK-MOV-GRADE-MSK       PIC X(02) JUSTIFIED RIGHT.
       77  WRK-MOV-LEN-MSK         PIC X(03) JUSTIFIED RIGHT.
       77  WRK-TECLA               PIC X(01).
       77  WRK-STATUS              PIC 9(03).
       77  WRK-ALTER               PIC 9(01) VALUE 0.

       01  WRK-AREA.
           05 WRK-MENU-TITLE       PIC X(30).
           05 WRK-MENU-ITEM        PIC X(30) OCCURS 7 TIMES.
           05 WRK-MENU-SIZE        PIC 9(01).

       01  WRK-MOVIE OCCURS 2 TIMES.
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
                  BACKGROUND-COLOR 2 FROM "ALTERAR".
           05 DTA.
               10 LINE WRK-LINE COLUMN 05 PIC X(90)
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 FROM WRK-BUFF.
           05 NEW-INFO.
               10 LINE WRK-LINE COLUMN 56 PIC X(30)
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 FROM WRK-BUFF.

       01  UNCONFIRM.
           05 UNCONFIRM-SCREEN.
               10 LINE 03 COLUMN 05 PIC X(21) ERASE EOL
               BACKGROUND-COLOR 4 FROM "REGISTRO NAO ALTERADO".
               10 LINE 04 COLUMN 05 PIC X(27) ERASE EOL
               FOREGROUND-COLOR 7 FROM "PRESSIONE ENTER PARA VOLTAR".

       PROCEDURE DIVISION USING LNK-BUFF.
       0000-MAIN-PROCEDURE.
           PERFORM 0010-ZERO-INFO.
           PERFORM 0020-DRAW-MENU.
           PERFORM 0030-GET-SEARCH-INFO.
           PERFORM 0040-SEARCH-MOVIE.
           IF WRK-STATUS EQUAL ZEROES
               PERFORM 0050-GET-ALTER-INFO
               PERFORM 0060-CHECK-ALTER-INFO
               IF WRK-ALTER EQUAL 1
                   PERFORM 0070-CONFIRM-ALTER-INFO
               END-IF
           END-IF.
           GOBACK.

      *=================================================================
       0010-ZERO-INFO      SECTION.
      *=================================================================
           MOVE ZEROES TO WRK-STATUS.

           MOVE SPACES TO WRK-MOV-COD-MSK.
           MOVE SPACES TO WRK-MOV-LEN-MSK.
           MOVE SPACES TO WRK-MOV-GRADE-MSK.

           MOVE ZEROES TO WRK-MOV-COD(01).
           MOVE SPACES TO WRK-MOV-TITLE(01).
           MOVE SPACES TO WRK-MOV-GENRE(01).
           MOVE ZEROES TO WRK-MOV-LEN(01).
           MOVE SPACES TO WRK-MOV-PUBLI(01).
           MOVE ZEROES TO WRK-MOV-GRADE(01).

           MOVE ZEROES TO WRK-MOV-COD(02).
           MOVE SPACES TO WRK-MOV-TITLE(02).
           MOVE SPACES TO WRK-MOV-GENRE(02).
           MOVE ZEROES TO WRK-MOV-LEN(02).
           MOVE SPACES TO WRK-MOV-PUBLI(02).
           MOVE ZEROES TO WRK-MOV-GRADE(02).
      *=================================================================
       0020-DRAW-MENU      SECTION.
      *=================================================================
           MOVE "ALTERACAO" TO WRK-MENU-TITLE.
           MOVE "CODIGO: " TO WRK-MENU-ITEM(01).
           MOVE 1 TO WRK-MENU-SIZE.
           CALL "MENUS" USING WRK-AREA.
           DISPLAY "PRESSIONE ENTER PARA VOLTAR" AT 1005.

      *=================================================================
       0030-GET-SEARCH-INFO      SECTION.
      *=================================================================
           ACCEPT WRK-MOV-COD-MSK AT 0320.
           IF WRK-MOV-COD-MSK EQUAL SPACES
               GOBACK
           END-IF.

      *=================================================================
       0040-SEARCH-MOVIE      SECTION.
      *=================================================================
           MOVE WRK-MOV-COD-MSK TO WRK-MOV-COD(01).
           CALL "SEARCHMOVIE" USING WRK-MOVIE(01),WRK-STATUS.

           MOVE SPACES TO WRK-MOV-COD-MSK.
           MOVE SPACES TO WRK-MOV-LEN-MSK.
           MOVE SPACES TO WRK-MOV-GRADE-MSK.


      *=================================================================
       0050-GET-ALTER-INFO   SECTION.
      *=================================================================
           MOVE "ALTERACAO" TO WRK-MENU-TITLE.
           MOVE "CODIGO: " TO WRK-MENU-ITEM(01).
           MOVE "TITULO: " TO WRK-MENU-ITEM(02).
           MOVE "GENERO: " TO WRK-MENU-ITEM(03).
           MOVE "DURACAO: " TO WRK-MENU-ITEM(04).
           MOVE "DISTRIBUIDORA: " TO WRK-MENU-ITEM(05).
           MOVE "NOTA: " TO WRK-MENU-ITEM(06).
           MOVE 6 TO WRK-MENU-SIZE.
           CALL "MENUS" USING WRK-AREA.
           DISPLAY "PRESSIONE ENTER PARA VOLTAR" AT 1005.

           DISPLAY WRK-MOV-COD(01)         AT 0320.
           ACCEPT WRK-MOV-TITLE(02)        AT 0420.
           ACCEPT WRK-MOV-GENRE(02)        AT 0520.
           ACCEPT WRK-MOV-LEN-MSK          AT 0620.
           ACCEPT WRK-MOV-PUBLI(02)        AT 0720.
           ACCEPT WRK-MOV-GRADE-MSK        AT 0820.

           MOVE WRK-MOV-LEN-MSK TO WRK-MOV-LEN(02).
           MOVE WRK-MOV-GRADE-MSK TO WRK-MOV-GRADE(02).

      *=================================================================
       0060-CHECK-ALTER-INFO   SECTION.
      *=================================================================
           IF WRK-MOV-LEN-MSK NOT EQUAL SPACES AND
           WRK-MOV-LEN(02) EQUAL ZEROES
               MOVE 602 TO WRK-STATUS
           IF WRK-MOV-GRADE-MSK NOT EQUAL SPACES AND
           WRK-MOV-GRADE(02) EQUAL ZEROES
               MOVE 603 TO WRK-STATUS
           END-IF.

           IF WRK-STATUS NOT EQUAL ZEROES
               CALL "ERROS" USING WRK-STATUS
           ELSE
               IF WRK-MOV-LEN(02) NOT EQUAL ZEROES
                   MOVE 1 TO WRK-ALTER
               ELSE
                   MOVE WRK-MOV-LEN(01) TO WRK-MOV-LEN(02)
               END-IF
               IF WRK-MOV-GRADE(02) NOT EQUAL ZEROES
                   MOVE 1 TO WRK-ALTER
               ELSE
                   MOVE WRK-MOV-GRADE(01) TO WRK-MOV-GRADE(02)
               END-IF
               IF WRK-MOV-TITLE(02) NOT EQUAL SPACES
                   MOVE 1 TO WRK-ALTER
               ELSE
                   MOVE WRK-MOV-TITLE(01) TO WRK-MOV-TITLE(02)
               END-IF
               IF WRK-MOV-GENRE(02) NOT EQUAL SPACES
                   MOVE 1 TO WRK-ALTER
               ELSE
                   MOVE WRK-MOV-GENRE(01) TO WRK-MOV-GENRE(02)
               END-IF
               IF WRK-MOV-PUBLI(02) NOT EQUAL SPACES
                   MOVE 1 TO WRK-ALTER
               ELSE
                   MOVE WRK-MOV-PUBLI(01) TO WRK-MOV-PUBLI(02)
               END-IF
           END-IF.


      *=================================================================
       0070-CONFIRM-ALTER-INFO   SECTION.
      *=================================================================
           MOVE WRK-MOV-COD(01) TO WRK-MOV-COD(02).
           DISPLAY CLEAR-SCREEN.
           DISPLAY SHOW-SCREEN.

           DISPLAY "DE" AT 0405.
           DISPLAY "PARA" AT 0456.

           MOVE SPACES TO WRK-BUFF.
           MOVE 05 TO WRK-LINE.
               STRING "CODIGO:        " WRK-MOV-COD(01) INTO WRK-BUFF.
           DISPLAY DTA.

           MOVE SPACES TO WRK-BUFF.
           MOVE 06 TO WRK-LINE.
               STRING "TITULO:        " WRK-MOV-TITLE(01) INTO WRK-BUFF.
           DISPLAY DTA.
           MOVE SPACES TO WRK-BUFF.
           MOVE WRK-MOV-TITLE(02) TO WRK-BUFF
           DISPLAY NEW-INFO.

           MOVE SPACES TO WRK-BUFF.
           MOVE 07 TO WRK-LINE.
               STRING "GENERO:        " WRK-MOV-GENRE(01) INTO WRK-BUFF.
           DISPLAY DTA.
           MOVE SPACES TO WRK-BUFF.
           MOVE WRK-MOV-GENRE(02) TO WRK-BUFF
           DISPLAY NEW-INFO.

           MOVE SPACES TO WRK-BUFF.
           MOVE 08 TO WRK-LINE.
               STRING "DURACAO:       " WRK-MOV-LEN(01) INTO WRK-BUFF.
           DISPLAY DTA.
           MOVE SPACES TO WRK-BUFF.
           MOVE WRK-MOV-LEN(02) TO WRK-BUFF
           DISPLAY NEW-INFO.

           MOVE SPACES TO WRK-BUFF.
           MOVE 09 TO WRK-LINE.
               STRING "DISTRIBUIDORA: " WRK-MOV-PUBLI(01) INTO WRK-BUFF.
           DISPLAY DTA.
           MOVE SPACES TO WRK-BUFF.
           MOVE WRK-MOV-PUBLI(02) TO WRK-BUFF
           DISPLAY NEW-INFO.

           MOVE SPACES TO WRK-BUFF.
           MOVE 10 TO WRK-LINE.
               STRING "NOTA:          " WRK-MOV-GRADE(01) INTO WRK-BUFF.
           DISPLAY DTA.
           MOVE SPACES TO WRK-BUFF.
           MOVE WRK-MOV-GRADE(02) TO WRK-BUFF
           DISPLAY NEW-INFO.

           DISPLAY "CONFIMA A ALTERACAO DO FILME (S/N)? " AT 1201.
           ACCEPT WRK-TECLA AT 1236.

           IF WRK-TECLA EQUAL 'S'
               MOVE 0 TO WRK-STATUS
               CALL "ALTERMOVIE" USING WRK-MOVIE(02),WRK-STATUS
               DISPLAY CLEAR-SCREEN
               DISPLAY "REGISTRO ALTERADO" AT 0510
               DISPLAY "PRESSIONE ENTER PARA CONTINUAR" AT 0610
           ELSE
               DISPLAY CLEAR-SCREEN
               DISPLAY UNCONFIRM-SCREEN
           END-IF.
           ACCEPT WRK-TECLA.
       END PROGRAM ALTERAR.
