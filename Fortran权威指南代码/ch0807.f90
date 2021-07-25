PROGRAM ch0807
!
! Use the bit functions in Fortran to write out a
! 32 bit integer number as a sequence of
! zeros and ones 
!
INTEGER :: J
INTEGER :: I
INTEGER ( SELECTED_INT_KIND( 2)) :: I1
INTEGER ( SELECTED_INT_KIND( 4)) :: I2
INTEGER ( SELECTED_INT_KIND( 9)) :: I3
CHARACTER (LEN=32) :: I_in_Bits
  PRINT *,' Type in an integer '
  READ * , I
  I1=INT(I,KIND(2))
  I2=INT(I,KIND(4))
  I3=INT(I,KIND(9))
  I_in_Bits=' '
  DO J=0,7
    IF (BTEST(I1,J)) THEN
      I_in_Bits(8-J:8-J)='1'
    ELSE
      I_in_Bits(8-J:8-J)='0'
    END IF
  END DO
  PRINT *,'         1         2         3'
  PRINT *,'1234567890123456789012345678901234567890'
  PRINT *,I1
  PRINT *,I_in_Bits
  DO J=0,15
    IF (BTEST(I2,J)) THEN
      I_in_Bits(16-J:16-J)='1'
    ELSE
      I_in_Bits(16-J:16-J)='0'
    END IF
  END DO
  PRINT *,I2
  PRINT *,I_in_Bits
  DO J=0,31
    IF (BTEST(I3,J)) THEN
      I_in_Bits(32-J:32-J)='1'
    ELSE
      I_in_Bits(32-J:32-J)='0'
    END IF
  END DO
  PRINT *,I3
  PRINT *,I_in_Bits
END PROGRAM ch0807


