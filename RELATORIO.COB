      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Mostrar todos os  filmes cadastrados no arquivo
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RELATORIO.
       ENVIRONMENT     DIVISION.
       INPUT-OUTPUT    SECTION.
       FILE-CONTROL.
           SELECT MOVIES ASSIGN TO "MOVIES.DAT"
           FILE STATUS IS WRK-STATUS
           ORGANISATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
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
       77  WRK-STATUS              PIC 9(03)  VALUE ZEROES.
       77  WRK-HEADER              PIC X(66)  VALUE SPACES.
       77  WRK-LINE                PIC 9(04)  VALUE ZEROES.
       77  WRK-TECLA               PIC X(01)  VALUE SPACES.
       LINKAGE SECTION.
       01 PARAMETRES.
           02 PA-RETURN-CODE PIC 99 VALUE 0.
       SCREEN  SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  SHOW-MV.
           05 TITLE-SCREEN.
               10 LINE 01 COLUMN 01 PIC X(6) ERASE EOL
                  BACKGROUND-COLOR 2 FROM "FILMES".
           05 HEADER-SCREEN.
               10 LINE 02 COLUMN 01 PIC X(66) ERASE EOL
                  BACKGROUND-COLOR 2 FROM WRK-HEADER.
       PROCEDURE DIVISION USING PARAMETRES.
       MAIN-PROCEDURE.

           OPEN INPUT MOVIES.
           IF WRK-STATUS EQUAL ZEROES
               PERFORM 0010-INIT
               PERFORM 0020-READ-FILE
               ADD 1 TO WRK-LINE
               ACCEPT WRK-TECLA AT WRK-LINE
           ELSE
               CALL "ERROS" USING WRK-STATUS
           END-IF.
           CLOSE MOVIES.
           GOBACK.
      *=================================================================
       0010-INIT  SECTION.
      *=================================================================
               STRING "COD  TITULO                        GENERO  "
               "DUR DISTRIBUIDORA NOTA"
               INTO WRK-HEADER.
               DISPLAY CLEAR-SCREEN.
               DISPLAY TITLE-SCREEN.
               DISPLAY HEADER-SCREEN.
      *=================================================================
       0020-READ-FILE  SECTION.
      *=================================================================
           PERFORM UNTIL WRK-STATUS NOT EQUAL 0
                   READ MOVIES
                   IF WRK-STATUS EQUAL 0
                      DISPLAY FS-MOVIE AT 0001
                   ELSE IF WRK-STATUS EQUAL 100
                       EXIT PERFORM
                   ELSE
                       CALL "ERROS" USING WRK-STATUS
                   END-IF
               END-PERFORM.
       END PROGRAM RELATORIO.
