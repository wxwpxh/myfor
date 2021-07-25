PROGRAM ch1007
IMPLICIT NONE
REAL , DIMENSION(-180:180) :: Time=0
INTEGER :: Degree,Strip
REAL :: Value
  DO Degree=-180,165,15 
    Value=Degree/15.
    DO Strip=0,14
      Time(Degree+Strip)=Value 
    ENDDO
  ENDDO
  DO Degree=-180,180
    PRINT *,Degree,' ',Time(Degree)
  END DO
END PROGRAM ch1007

