      program ACHOL0
      DIMENSION A(4,4),D(4,2)
      DOUBLE PRECISION A,D
      DATA A/5.0,7.0,6.0,5.0,7.0,10.0,8.0,7.0,
     *         6.0,8.0,10.0,9.0,5.0,7.0,9.0,10.0/
      DATA D/23.0,32.0,33.0,31.0,92.0,128.0,132.0,124.0/
      CALL ACHOL(A,4,2,D,L)
      IF (L.NE.0) THEN
        WRITE(*,10) ((D(I,J),J=1,2),I=1,4)
      END IF
10    FORMAT(1X,2D15.6)
      END
