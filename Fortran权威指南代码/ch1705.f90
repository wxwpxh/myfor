PROGRAM ch1705
IMPLICIT NONE
CHARACTER (LEN=20) :: Name 
INTEGER :: Name_Length
  PRINT *,' Type in your name'
  READ  '(A)',Name
!
! show LEN first
!
  Name_length=LEN(Name)
  PRINT *,' Name length is ',Name_length
  PRINT *,' ',Name(1:Name_length),'<-end is here'
  Name_length=LEN_TRIM(Name)
  PRINT *,' Name length is ',Name_length
  PRINT *,' ',Name(1:Name_Length),'<-end is here'
END PROGRAM ch1705

