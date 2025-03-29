      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Obter informacoes de filmes para gravacao
      *=================================================================

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CADASTRAR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WRK-BUFF                PIC X(30).
       77  WRK-LINE                PIC 9(01).
       77  WRK-TRIES               PIC 9(01) VALUE ZEROES.
       77  WRK-MOV-COD-MSK         PIC X(04) JUSTIFIED RIGHT.
       77  WRK-MOV-GRADE-MSK       PIC X(02) JUSTIFIED RIGHT.
       77  WRK-MOV-LEN-MSK         PIC X(03) JUSTIFIED RIGHT.
       77  WRK-CONFIRM             PIC X(01).
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
       01  CONFIRM.
           05 CONFIRM-SCREEN.
               10 LINE 03 COLUMN 01 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 2 FROM "FILME".
           05 DTA.
               10 LINE WRK-LINE COLUMN 05 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 2 FROM WRK-BUFF.
       01  UNCONFIRM.
           05 UNCONFIRM-SCREEN.
               10 LINE 03 COLUMN 05 PIC X(20) ERASE EOL
               BACKGROUND-COLOR 4 FROM "FILME NAO CADASTRADO".
               10 LINE 04 COLUMN 05 PIC X(27) ERASE EOL
               FOREGROUND-COLOR 7 FROM "PRESSIONE ENTER PARA VOLTAR".

       PROCEDURE DIVISION USING LNK-BUFF.
       0000-MAIN-PROCEDURE.
           PERFORM 0010-ZERO-INFO.
           PERFORM 0020-DRAW-MENU.
           PERFORM 0030-GET-INFO.
           PERFORM 0040-VALIDATE-INFO.
           IF WRK-STATUS EQUAL ZEROES
               PERFORM 0050-CONFIRM-CREATE.
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
           MOVE "CADASTRO" TO WRK-MENU-TITLE.
           MOVE "CODIGO: " TO WRK-MENU-ITEM(01).
           MOVE "TITULO: " TO WRK-MENU-ITEM(02).
           MOVE "GENERO: " TO WRK-MENU-ITEM(03).
           MOVE "DURACAO: " TO WRK-MENU-ITEM(04).
           MOVE "DISTRIBUIDORA: " TO WRK-MENU-ITEM(05).
           MOVE "NOTA: " TO WRK-MENU-ITEM(06).
           MOVE 6 TO WRK-MENU-SIZE.
           CALL "MENUS" USING WRK-AREA.
           DISPLAY "PRESSIONE ENTER PARA VOLTAR" AT 1005.
      *=================================================================
       0030-GET-INFO      SECTION.
      *=================================================================
           ACCEPT WRK-MOV-COD-MSK      AT 0320.
           IF WRK-MOV-COD-MSK EQUAL SPACES
               GOBACK
           END-IF.
           ACCEPT WRK-MOV-TITLE        AT 0420.
           ACCEPT WRK-MOV-GENRE        AT 0520.
           ACCEPT WRK-MOV-LEN-MSK      AT 0620.
           ACCEPT WRK-MOV-PUBLI        AT 0720.
           ACCEPT WRK-MOV-GRADE-MSK    AT 0820.

           MOVE WRK-MOV-COD-MSK TO WRK-MOV-COD.
           MOVE WRK-MOV-LEN-MSK TO WRK-MOV-LEN.
           MOVE WRK-MOV-GRADE-MSK TO WRK-MOV-GRADE.

      *=================================================================
       0040-VALIDATE-INFO      SECTION.
      *=================================================================
           IF WRK-MOV-COD EQUAL ZEROES
               GOBACK
           ELSE IF WRK-MOV-LEN EQUAL ZEROES
               MOVE 602 TO WRK-STATUS
           ELSE IF WRK-MOV-GRADE EQUAL ZEROES
               MOVE 603 TO WRK-STATUS
           ELSE IF WRK-MOV-TITLE EQUAL SPACES
               MOVE 604 TO WRK-STATUS
           ELSE IF WRK-MOV-GENRE EQUAL SPACES
               MOVE 605 TO WRK-STATUS
           ELSE IF WRK-MOV-PUBLI EQUAL SPACES
               MOVE 606 TO WRK-STATUS

           END-IF.
           IF WRK-STATUS NOT EQUAL ZEROES
               CALL "ERROS" USING WRK-STATUS
           END-IF.

      *=================================================================
       0050-CONFIRM-CREATE      SECTION.
      *=================================================================
           DISPLAY CLEAR-SCREEN.
           DISPLAY CONFIRM-SCREEN.

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

           DISPLAY "CONFIMA O CADASTRO DO FILME (S/N)? " AT 1101.
           ACCEPT WRK-CONFIRM AT 1136.

           IF WRK-CONFIRM EQUAL 'S'
               PERFORM 0060-WRITE-FILE
           ELSE
               DISPLAY CLEAR-SCREEN
               DISPLAY UNCONFIRM-SCREEN
               ACCEPT WRK-BUFF
           END-IF.

      *=================================================================
       0060-WRITE-FILE      SECTION.
      *=================================================================
           CALL "WRITEMOVIE" USING WRK-MOVIE, WRK-STATUS.
       END PROGRAM CADASTRAR.
