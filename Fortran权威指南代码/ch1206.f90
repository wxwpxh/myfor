PROGRAM ch1206
!
! This program reads in and prints out
! your first name
!
IMPLICIT NONE
CHARACTER (20) :: First_name
!
  PRINT *,' Type in your first name.'
  PRINT *,' up to 20 characters'
  READ *,First_Name
  PRINT 100,First_Name
  100 FORMAT(1x,A)
!
END PROGRAM ch1206

