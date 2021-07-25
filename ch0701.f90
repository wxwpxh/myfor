! gfortran -o ch0701 ch0701.f90
! f95 -o ch0701 ch0701.f90

PROGRAM ch0701
!
! This program reads in and prints out a name
!
IMPLICIT NONE
CHARACTER*20 :: First_Name
!
  PRINT *,' Type in your first name.'
  PRINT *,' up to 20 characters'
  READ *,First_Name
  PRINT *,First_Name
!
END PROGRAM ch0701

