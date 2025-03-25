      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 25/MAR/2025
      * Objetivo: Gravar infomações de filmes
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITEMOVIE.
       ENVIRONMENT     DIVISION.
       INPUT-OUTPUT    SECTION.
       FILE-CONTROL.
           SELECT MOVIES ASSIGN TO "MOVIES.DAT"
           FILE STATUS IS WRK-STATUS
           ORGANISATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS FS-MOV-COD.
       DATA DIVISION.
       FILE SECTION.
           FD  MOVIES.
           01 FS-MOVIE.
               05 FS-MOV-COD          PIC 9(05) VALUE ZEROES.
               05 FS-MOV-TITLE        PIC X(30) VALUE SPACES.
               05 FS-MOV-GENRE        PIC X(08) VALUE SPACES.
               05 FS-MOV-LEN          PIC 9(03) VALUE ZEROES.
               05 FS-MOV-PUBLI        PIC X(15) VALUE SPACES.
               05 FS-MOV-GRADE        PIC 9(02) VALUE ZEROES.
       WORKING-STORAGE SECTION.
       77  WRK-STATUS                 PIC 9(03).
       77  WRK-BUFF                   PIC X(01).
       77  WRK-TRIES                  PIC 9 VALUE ZEROES.
       LINKAGE SECTION.
       01 LNK-MOVIE.
           05 LNK-MOV-COD             PIC 9(05) VALUE ZEROES.
           05 LNK-MOV-TITLE           PIC X(30) VALUE SPACES.
           05 LNK-MOV-GENRE           PIC X(08) VALUE SPACES.
           05 LNK-MOV-LEN             PIC 9(03) VALUE ZEROES.
           05 LNK-MOV-PUBLI           PIC X(15) VALUE SPACES.
           05 LNK-MOV-GRADE           PIC 9(02) VALUE ZEROES.
       SCREEN          SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  SUCCESS-SCREEN.
           05 TITLE.
               10 LINE 07 COLUMN 05 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 2 FROM "FILME CADASTRADO".
           05 .
               10 LINE 08 COLUMN 05 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 7 FROM
                  "PRESSIONE ENTER PARA VOLTAR".
       PROCEDURE DIVISION USING LNK-MOVIE.
       0000-MAIN-PROCEDURE.
           MOVE LNK-MOVIE TO FS-MOVIE.
           PERFORM 0010-OPEN-FILE.
           PERFORM 0020-WRITE-FILE.
           PERFORM 9999-CLOSE-FILE.
           GOBACK.

      *=================================================================
       0010-OPEN-FILE      SECTION.
      *=================================================================
           OPEN I-O MOVIES.

      *=================================================================
       0020-WRITE-FILE      SECTION.
      *=================================================================

           WRITE FS-MOVIE.
           IF WRK-STATUS EQUAL 480 AND WRK-TRIES LESS THAN 1
               ADD 1 TO WRK-TRIES
               PERFORM 9999-CLOSE-FILE
               OPEN OUTPUT MOVIES
               CLOSE MOVIES
               PERFORM 0000-MAIN-PROCEDURE
           ELSE IF WRK-TRIES GREATER THAN 0 AND WRK-STATUS NOT EQUAL 0
               CALL "ERROS" USING WRK-STATUS
           ELSE
               DISPLAY CLEAR-SCREEN
               DISPLAY SUCCESS-SCREEN
               ACCEPT WRK-BUFF
           END-IF.
      *=================================================================
       9999-CLOSE-FILE     SECTION.
      *=================================================================
           CLOSE MOVIES.



       END PROGRAM WRITEMOVIE.
