PROGRAM ch2002
IMPLICIT NONE
TYPE Address
  CHARACTER (LEN=40) :: Name
  CHARACTER (LEN=60) :: Street
  CHARACTER (LEN=60) :: District
  CHARACTER (LEN=60) :: City
  CHARACTER (LEN=8)  :: Post_Code
END TYPE Address
INTEGER , PARAMETER :: N_of_Address=78
TYPE (Address) , DIMENSION(N_of_Address):: Addr
INTEGER :: I
  OPEN(UNIT=1,FILE="ADDRESS.DAT")
  DO I=1,N_of_Address
    READ(UNIT=1,FMT='(A40)') Addr(I)%Name
    READ(UNIT=1,FMT='(A60)') Addr(I)%Street
    READ(UNIT=1,FMT='(A60)') Addr(I)%District 
    READ(UNIT=1,FMT='(A60)') Addr(I)%City 
    READ(UNIT=1,FMT='(A8)') Addr(I)%Post_Code
  END DO
  DO I=1,N_of_Address
    PRINT *,Addr(I)%Name
    PRINT *,Addr(I)%Street
    PRINT *,Addr(I)%District
    PRINT *,Addr(I)%City
    PRINT *,Addr(I)%Post_Code
  END DO
END PROGRAM ch2002


