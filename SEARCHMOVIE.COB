      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Consultar informacoes de filmes cadastrados
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEARCHMOVIE.
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
       LINKAGE SECTION.
       77  LNK-STATUS                 PIC 9(03).
       01  LNK-MOVIE.
           05 LNK-MOV-COD             PIC 9(05) VALUE ZEROES.
           05 LNK-MOV-TITLE           PIC X(30) VALUE SPACES.
           05 LNK-MOV-GENRE           PIC X(08) VALUE SPACES.
           05 LNK-MOV-LEN             PIC 9(03) VALUE ZEROES.
           05 LNK-MOV-PUBLI           PIC X(15) VALUE SPACES.
           05 LNK-MOV-GRADE           PIC 9(02) VALUE ZEROES.

       PROCEDURE DIVISION USING LNK-MOVIE,LNK-STATUS.
       MAIN-PROCEDURE.
           OPEN INPUT MOVIES.
           IF LNK-STATUS NOT EQUAL TO ZEROES
               CALL "ERROS" USING LNK-STATUS
               CLOSE MOVIES
               GOBACK
           END-IF.
           MOVE LNK-MOVIE TO FS-MOVIE.
           READ MOVIES
               INVALID KEY
                   MOVE 607 TO LNK-STATUS
                   CALL "ERROS" USING LNK-STATUS
               NOT INVALID KEY
                   MOVE FS-MOVIE TO LNK-MOVIE
           END-READ.
           CLOSE MOVIES.
           GOBACK.
       END PROGRAM SEARCHMOVIE.
