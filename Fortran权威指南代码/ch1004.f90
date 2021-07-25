PROGRAM C1004
! Variables used 
! H1,H2,H3 - used to hold the heights above sea level
! H4 - used to hold the average of the above
! Long - used to represent the longitude
! Lat - used to represent the latitude
!    both restricted to integer values.
IMPLICIT NONE
INTEGER , PARAMETER :: Size = 3
INTEGER  :: Lat , Long
REAL , DIMENSION(1:Size,1:Size) :: H1,H2,H3,H4
  DO Lat = 1,Size
      READ * , (H1(Lat,Long), Long=1,Size)
  ENDDO
  DO Lat = 1,Size
      READ * , (H2(Lat,Long), Long=1,Size)
  ENDDO
  DO Lat = 1,Size
      READ * , (H3(Lat,Long), Long=1,Size)
  ENDDO
  DO Lat = 1,Size
    DO Long = 1,Size
      H4(Lat,Long)=( H1(Lat,Long) + H2(Lat,Long) + &
                 H3(Lat,Long) ) / Size
    ENDDO
  ENDDO
  DO Lat = 1,Size
      PRINT * , (H4(Lat,Long),Long=1,3)
  ENDDO
END PROGRAM C1004


