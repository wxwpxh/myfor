PROGRAM C1002
! Variables used 
! Height - used to hold the heights above sea level
! Long - used to represent the longitude
! Lat - used to represent the latitude
!    both restricted to integer values.
! Correct - holds the correction factor
IMPLICIT NONE
INTEGER , PARAMETER :: Size = 3
INTEGER  :: Lat , Long
REAL , DIMENSION(1:Size,1:Size) :: Height
REAL , PARAMETER :: Correct = 10.0
  DO Lat = 1,Size
    DO Long = 1,Size
      PRINT *,' Type in value at ',Lat,' ',Long
      READ * , Height(Lat,Long)
    ENDDO
  ENDDO
  DO Lat = 1,Size
    DO Long = 1,Size
      Height(Lat,Long) = Height(Lat,Long) + Correct
    ENDDO
  ENDDO
  PRINT * , ' Corrected data is '
  DO Lat = 1,Size
    DO Long = 1,Size
      PRINT * , Height(Lat,Long)
    ENDDO
  ENDDO
END PROGRAM C1002
