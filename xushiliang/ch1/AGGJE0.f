      program AGGJE0
      DIMENSION A(8,8),B(8),JS(8)
      DOUBLE PRECISION A,B
      DATA A/3*0.0,3.0,0.0,1.0,3*0.0,6.0,4*0.0,4.0,0.0,-1.0,
     *         3*0.0,6.0,2*0.0,1.0,2*0.0,2.0,3*0.0,-1.0,4*0.0,
     *         -2.0,0.0,-3.0,0.0,-1.0,0.0,-6.0,6*0.0,2.0,2*0.0,
     *         1.0,5.0,5*0.0,-4.0,2*0.0,2.0,0.0,-2.0/
      DATA B/4.0,6.0,-8.0,-2.0,27.0,-9.0,2.0,-4.0/
      CALL AGGJE(A,8,B,L,JS)
      IF (L.NE.0) THEN
        WRITE(*,10) (B(I),I=1,8)
      END IF
10    FORMAT(1X,D15.6)
      END
