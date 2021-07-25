C   The roots of Quadratic equation,complex solution;
C   quadcmplex.f
C
      PROGRAM quadcmplex
      COMPLEX X1, X2 	  
      REAL A,B,C,D,PART1,PART2
      PRINT *,'inpur 3 number:A B C'
      READ(*,*)A,B,C
      IF (A.EQ.0.0) THEN
       WRITE(*,*) 'Quadratic Term Ratio cannot be 0!'
       STOP
      ENDIF
      D=B*B-4.0*A*C
      PART1= - B/( 2.0*A) 
      PART2= SQRT( ABS(D))/(2.0*A) 
      IF (D.GE.0.0) THEN
          X1= CMPLX ( PART1+PART2, 0.0)
          X2= CMPLX ( PART1, - PART2)
      ELSE
          X1= CMPLX( PART1, PART2)
          X2= CMPLX( PART1, -PART2) 
      END IF	  
      WRITE(*,*) 'X1=' ,X1
      WRITE(*,*) 'X2=' ,X2 
      STOP
      END
