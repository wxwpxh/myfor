      program AGMIV0
      DIMENSION A(4,3),U(4,4),V(3,3),B(4),C(3,4),X(3)
      DIMENSION S(5),E(5),WORK(5)
      DOUBLE PRECISION A,U,V,B,C,X,S,E,WORK
      DATA A/1.0,2.0,1.0,-1.0,1.0,1.0,-1.0,2.0,-1.0,2*0.0,1.0/
      DATA B/2.0,-3.0,1.0,4.0/
      M=4
      N=3
      KA=5
      EPS=0.000001
      WRITE(*,*)
      WRITE(*,10)
10    FORMAT(1X,'MAT A IS:')
      WRITE(*,200) ((A(I,J),J=1,N),I=1,M)
      CALL AGMIV(M,N,A,B,C,X,L,EPS,U,V,KA,S,E,WORK)
      IF (L.EQ.0) THEN
        WRITE(*,*)
        WRITE(*,50)
50      FORMAT(1X,'MAT A+ IS:')
        WRITE(*,60) ((C(I,J),J=1,M),I=1,N)
60      FORMAT(1X,4D13.6)
        WRITE(*,*)
        WRITE(*,*) 'THE SOLUTION TO THE LEAST SQUARES PROBLEM IS:'
        WRITE(*,100) (I,X(I),I=1,N)
100     FORMAT(1X,'X(',I2,')=',D15.6)
      END IF
      WRITE(*,*)
      CALL BGINV(N,M,C,A,L,EPS,U,V,KA,S,E,WORK)
      IF (L.EQ.0) THEN
        WRITE(*,70)
70      FORMAT(1X,'MAT A++ IS:')
        WRITE(*,200) ((A(I,J),J=1,N),I=1,M)
200     FORMAT(1X,3D15.6)
        WRITE(*,*)
      END IF
      END
