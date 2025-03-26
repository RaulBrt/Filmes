      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Gravar informacoes de um filme
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITEMOVIE.
       ENVIRONMENT     DIVISION.
       INPUT-OUTPUT    SECTION.
       FILE-CONTROL.
           SELECT MOVIES ASSIGN TO "MOVIES.DAT"
           FILE STATUS IS LNK-STATUS
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
       77  WRK-TRIES               PIC 9(01) VALUE ZEROES.
       77  WRK-BUFF                PIC X(01) VALUE SPACES.
       LINKAGE SECTION.
       01  LNK-STATUS              PIC 9(03).
       01  LNK-MOVIE.
           05 LNK-MOV-COD          PIC 9(05).
           05 LNK-MOV-TITLE        PIC X(30).
           05 LNK-MOV-GENRE        PIC X(08).
           05 LNK-MOV-LEN          PIC 9(03).
           05 LNK-MOV-PUBLI        PIC X(15).
           05 LNK-MOV-GRADE        PIC 9(02).
       SCREEN  SECTION.
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

       PROCEDURE DIVISION USING LNK-MOVIE,LNK-STATUS.
       0000-MAIN-PROCEDURE.
           MOVE ZEROES TO LNK-STATUS.
           OPEN I-O MOVIES.
           IF LNK-STATUS EQUAL 480 AND WRK-TRIES LESS THAN 1
               ADD 1 TO WRK-TRIES
               CLOSE MOVIES
               OPEN OUTPUT MOVIES
               CLOSE MOVIES
               PERFORM 0000-MAIN-PROCEDURE
           ELSE IF WRK-TRIES GREATER THAN 0 AND LNK-STATUS NOT EQUAL 0
               CALL "ERROS" USING LNK-STATUS
           ELSE
               MOVE LNK-MOVIE TO FS-MOVIE
               WRITE FS-MOVIE
               IF LNK-STATUS EQUAL ZEROES
                   DISPLAY CLEAR-SCREEN
                   DISPLAY SUCCESS-SCREEN
                   ACCEPT WRK-BUFF
               ELSE
                   CALL "ERROS" USING LNK-STATUS
           END-IF.
           CLOSE MOVIES.

       END PROGRAM WRITEMOVIE.
