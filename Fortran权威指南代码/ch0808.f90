PROGRAM ch0808
!
! Use the bit functions in Fortran to write out a
! 32 bit integer number  equivalenced to a real 
! using the transfer intrinsic as a sequence of
! zeros and ones 
!
IMPLICIT NONE
INTEGER                        :: I,J
CHARACTER (LEN=32)               :: I_in_Bits=" "
REAL                           :: x=-1.0
  PRINT *,'         1         2         3'
  PRINT *,'1234567890123456789012345678901234567890'
  PRINT *,I_in_Bits
  I=TRANSFER(x,I)
  DO J=0,31
    IF (BTEST(i,J)) THEN
      I_in_Bits(32-J:32-J)='1'
    ELSE
      I_in_Bits(32-J:32-J)='0'
    END IF
  END DO
  PRINT *,x
  PRINT *,I_in_Bits
END PROGRAM  ch0808


