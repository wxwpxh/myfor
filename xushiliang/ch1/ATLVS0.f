      program ATLVS0
      DIMENSION T(6),B(6),X(6),Y(6),S(6)
      DOUBLE PRECISION T,B,X,Y,S
      DATA T/6.0,5.0,4.0,3.0,2.0,1.0/
      DATA B/11.0,9.0,9.0,9.0,13.0,17.0/
      CALL ATLVS(T,6,B,X,L,Y,S)
      IF (L.NE.0) THEN
        WRITE(*,10) (X(I),I=1,6)
      END IF
10    FORMAT(1X,D15.6)
      END
