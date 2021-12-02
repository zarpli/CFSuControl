00 REM CFSuControl 1.0 - CFSound Serial Port Control
01 REM Zarpli - Tecnología Interactiva
02 REM 11082012 Alejandro Zárate
03 REM https://github.com/zarpli/CFSuControl/
04 REM
11 if (@BAUD <> 15) then @BAUD = 15
12 @SOM = 2
13 PRINT CHR$(2),CHR$(2),CHR$(3),
20 ONEVENT @MSG$, GOSUB 40
21 ONEVENT @SOUND$, GOSUB 70
30 GOTO 30
40 C$ = @MSG$:@MSG$ = "":P = FIND(C$," ")
41 IF P > 0 THEN 42 ELSE 50
42 A$ = MID$(C$,P+1,LEN(C$)-P)
43 C$ = LEFT$(C$,P)
50 IF C$ = "PLAY" THEN 60
51 IF C$ = "STOP" THEN 61
52 IF C$ = "VOLUME" THEN 62
53 IF C$ = "PTT" THEN 63
54 RETURN
60 @SOUND$ = "":@SOUND$ = A$:RETURN
61 @SOUND$ = "":RETURN
62 @NSVOL = VAL(A$):RETURN
63 @PTT = VAL(A$):RETURN
70 LIF @SOUND$="" THEN PRINT CHR$(2),CHR$(8),CHR$(3),:RETURN
80 RETURN