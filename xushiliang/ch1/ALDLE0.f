      program ALDLE0
      DIMENSION A(5,5),C(5,2)
      DOUBLE PRECISION A,C
      DATA A/5.0,7.0,6.0,5.0,1.0,7.0,10.0,8.0,7.0,2.0,6.0,8.0,
     *       10.0,9.0,3.0,5.0,7.0,9.0,10.0,4.0,1.0,2.0,3.0,4.0,5.0/
      DATA C/24.0,34.0,36.0,35.0,15.0,96.0,136.0,144.0,140.0,60.0/
      CALL ALDLE(A,5,2,C,L)
      IF (L.NE.0) THEN
        WRITE(*,10) ((C(I,J),J=1,2),I=1,5)
      END IF
10    FORMAT(1X,2D15.6)
      END
