PROGRAM C2114
IMPLICIT NONE
TYPE Ragged
  REAL , DIMENSION(:) , POINTER :: rainfall
END TYPE
INTEGER :: i 
INTEGER :: nr
iNTEGER , ALLOCATABLE , DIMENSION (:) :: nc
TYPE (ragged) , ALLOCATABLE ,  DIMENSION(:) :: station
  PRINT *,' enter number of stations'
  READ *,nr
  ALLOCATE(station(1:nr))
  ALLOCATE(nc(1:nr))
  DO I=1,Nr
    PRINT *,' enter the number of data values ' , &
     ' for station ',i
    READ *,nc(i)
    ALLOCATE(station(i)%rainfall(1:nc(i)))
    PRINT *,' Type in the values for station ' , I
    READ *,station(i)%rainfall(1:nc(i))
  END DO
  DO i=1,nr
    PRINT *,station(i)%rainfall(1:nc(i))
  END DO
END PROGRAM C2114