C   The roots of Quadratic equation
C   quadra1.f
C
      PROGRAM QUADRATIC
          REAL A,B,C,D,XR1,XR2,X1
      PRINT *,'inpur 3 real:A B C'        
      READ(*,*)A,B,C
      IF (A.EQ.0.0) THEN
       WRITE(*,*) 'Quadratic Term Ratio cannot be 0!'
       STOP
      ENDIF
      D=B*B-4.0*A*C
      IF (D.LT.0.0) THEN
           XR1=-B/(2.0*A)
           X1=SQRT(-D)/(2.0*A)
       WRITE(*,10)XR1,X1,XR1,X1
   10  FORMAT (1X,'X1=',F8.3,'+',F8.3,'I','   X2=',F8.3,'-',F8.3,'I')
      ELSE
       XR1=(-B+SQRT(D))/(2.0*A)
       XR2=(-B+SQRT(D))/(2.0*A)
       WRITE(*,20) XR1,XR2
   20  FORMAT(1X,'X1=', F8.3,5X,'X2=', F8.3)
      ENDIF
      STOP        
      END
