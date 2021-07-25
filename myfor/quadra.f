      PROGRAM QUADRA
   50 READ(*,10)A,B,C
   10 FORMAT (3F3.1)
      IF (A.EQ.0.0) THEN
       WRITE(*,*) 'Quadratic Term Ratio cannot be 0!'
       STOP
      ENDIF
      D=B*B-4.0*A*C
      IF (D.LT.0.0) THEN
       WRITE(*,*) 'no real root!'
       STOP
      ENDIF
      X1=( B+SQRT(D))/(2.0*A)
      X2=(-B+SQRT(D))/(2.0*A)
      WRITE(*,20) X1,X2
   20 FORMAT(1X, F6.2,10X,F6.2)
      GO TO 50
      END
