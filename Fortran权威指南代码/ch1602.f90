PROGRAM ch1602
IMPLICIT NONE
INTEGER :: Year , N , Month , Day , T
!
! calculates day and month from year and
! day-within-year
! t is an offset to account for leap years.
! Note that the first criteria is division by 4
! but that centuries are only
! leap years if divisible by 400
! not 100 (4 * 25) alone.
!
  PRINT*,' year, followed by day within year'
  READ*,Year,N
!   checking for leap years 
  IF ((Year/4)*4 == Year ) THEN
    T=1
    IF ((Year/400)*400 == Year ) THEN
      T=1
    ELSEIF ((Year/100)*100 == Year) THEN
      T=0
    ENDIF  
  ELSE
    T=0
  ENDIF
!    accounting for February 
  IF(N > (59+T))THEN
    Day=N+2-T 
  ELSE
    Day=N
  ENDIF
  Month=(Day+91)*100/3055
  Day=(Day+91)-(Month*3055)/100 
  Month=Month-2
  PRINT*,' CALENDAR DATE IS ', Day , Month , Year
END PROGRAM ch1602


