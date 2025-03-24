      *=================================================================
      * Autor: RAUL T. BERTO
      * Data: 24/MAR/2025
      * Objetivo: Desehar menus
      *=================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENUS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  WRK-COUNT               PIC 9(1)    VALUE ZEROES.
       77  WRK-LINE                PIC 9(1)    VALUE ZEROES.
       77  WRK-OPTION              PIC X(1)    VALUE SPACES.
       77  WRK-ITEM                PIC X(30)   VALUE SPACES.

       LINKAGE         SECTION.
       01  LNK-AREA.
           05 LNK-MENU-TITLE       PIC X(30).
           05 LNK-MENU-ITEM        PIC X(30)
              OCCURS 7 TIMES.
           05 LNK-MENU-SIZE        PIC 9(1).
           05 LNK-SELECTED         PIC X(1).

       SCREEN          SECTION.
       01  CLEAR.
           05 CLEAR-SCREEN.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL.
       01  MAIN-MENU.
           05 TITLE.
               10 LINE 01 COLUMN 01 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 5 FROM LNK-MENU-TITLE.
           05 OPTN.
               10 LINE WRK-LINE COLUMN 05 PIC X(30) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 5 FROM WRK-ITEM.
           05 SELCT.
               10 LINE 12 COLUMN 05 PIC X(22) ERASE EOL
                  BACKGROUND-COLOR 0 FOREGROUND-COLOR 7
                  FROM "SELECIONE UMA OPCAO: ".


       PROCEDURE DIVISION USING LNK-AREA.
       MAIN-PROCEDURE.
       0000-MAIN           SECTION.

           DISPLAY CLEAR.

           DISPLAY TITLE.
           MOVE 02 TO WRK-LINE.
           PERFORM VARYING WRK-COUNT FROM 1 BY 1 UNTIL
           WRK-COUNT GREATER THAN LNK-MENU-SIZE
              ADD 1 TO WRK-LINE
              MOVE LNK-MENU-ITEM(WRK-COUNT) TO WRK-ITEM
              DISPLAY OPTN
           END-PERFORM.
           DISPLAY SELCT.
           ACCEPT LNK-SELECTED AT 1226.
           GOBACK.
       END PROGRAM MENUS.
