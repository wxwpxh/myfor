PROGRAM ch1102
! This program reads in a grid of temperatures
! (degrees Fahrenheit) at 25 grid references
! and converts them to degrees Celsius
IMPLICIT NONE
REAL, DIMENSION (1:5,1:5) :: Fahrenheit, Celsius
INTEGER :: Long, Lat
!
! Read in the temperatures 
!
  DO Lat=1,5 
    PRINT *, ' For Latitude= ',Lat
    DO Long=1,5   
      PRINT *, ' For Longitude', Long
      READ *,Fahrenheit( Long, Lat)
    END DO
  END DO
!
! Conversion applied to all values
!
  Celsius = 5.0/9.0 * (Fahrenheit - 32.0)
  PRINT * , Celsius
  PRINT * , Fahrenheit
END PROGRAM ch1102


