      program ATRDE0
      DIMENSION B(13),D(5)
      DOUBLE PRECISION B,D
      DATA B/13.0,12.0,11.0,10.0,9.0,8.0,
     *         7.0,6.0,5.0,4.0,3.0,2.0,1.0/
      DATA D/3.0,0.0,-2.0,6.0,8.0/
      CALL ATRDE(B,5,13,D,L)
      IF (L.GT.0) THEN
        WRITE(*,10) (D(I),I=1,5)
      END IF
10    FORMAT(1X,D15.6)
      END
