C **********************
C DO WHILE LOOP
C **********************
      PROGRAM DOWLOOP
      INTEGER COUNT a
          SUM = 0.0
          COUNT = 0
      PRINT *,'input  number:less than 0.0 to quit'
      READ * , SCORE
      DO 10 , WHILE (SCORE .GE. 0.0 )
      SUM = SUM + SCORE
      COUNT = COUNT + 1
      READ * , SCORE
 10   CONTINUE
      AVER = SUM/ COUNT
      PRINT *,'COUNT = ',COUNT
      PRINT *,'AVERAGE = ',AVER
      STOP
      END
