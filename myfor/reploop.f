C **********************
C REPEAT  LOOP 
C **********************
      PROGRAM RELOOP 
      REAL X
      X=10.0
 10   CONTINUE
      X=X/2
      WRITE(*,*) X
      IF (X.GT.1) GOTO 10
      STOP
      END
