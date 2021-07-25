C **********************
C WHILE LOOP 
C **********************
      PROGRAM WHLOOP
      REAL X
      X=10.0
 10   IF (X.GT.1) THEN
        X=X/2
        WRITE(*,*) X
        GOTO 10
      ENDIF
      STOP
      END
