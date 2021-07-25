PROGRAM ch0901
IMPLICIT NONE
REAL :: Total=0.0, Average=0.0
REAL , DIMENSION(1:12) :: RainFall
INTEGER :: Month
  PRINT *,' Type in the rainfall values'
  PRINT *,' one per line'
  DO Month=1,12
    READ *, RainFall(Month)
  ENDDO
  DO Month=1,12
    Total = Total + RainFall(Month)
  ENDDO
  Average = Total / 12
  PRINT *,' Average monthly rainfall was'
  PRINT *, Average
END PROGRAM ch0901

