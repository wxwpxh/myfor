PROGRAM ch1703
IMPLICIT NONE
  CHARACTER(80) :: String, Strip
  INTEGER :: IPOS,I,Length=80
  IPOS=0
  PRINT *,' Type in a string'
  READ '(A)',String
  DO I=1,Length
    IF(String(I:I) /= ' ') THEN 
      IPOS=IPOS+1 
      Strip(IPOS:IPOS)=String(I:I)
    ENDIF
  END DO
  PRINT*,String
  PRINT*,Strip
END PROGRAM ch1703

