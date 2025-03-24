      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITEFILE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WRK-ERROR.
           05 WRK-MSG              PIC X(40) VALUE SPACES.
           05 WRK-STATUS           PIC 9(03) VALUE ZEROES.

       LINKAGE SECTION.
       01 LNK-MOVIE.
           05 LNK-MOV-COD          PIC 9(05) VALUE ZEROES.
           05 LNK-MOV-TITLE        PIC X(30) VALUE SPACES.
           05 LNK-MOV-GENRE        PIC X(08) VALUE SPACES.
           05 LNK-MOV-LEN          PIC 9(03) VALUE ZEROES.
           05 LNK-MOV-PUBLI        PIC X(15) VALUE SPACES.
           05 LNK-MOV-GRADE        PIC 9(02) VALUE ZEROES.
       PROCEDURE DIVISION USING LNK-MOVIE.
       MAIN-PROCEDURE.
           GOBACK.
       END PROGRAM WRITEFILE.
