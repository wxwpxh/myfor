PROGRAM ch1402
IMPLICIT NONE
INTEGER :: IO_Stat_Number=-1
INTEGER :: I
  DO
    READ (UNIT=*,FMT=10,&
      IOSTAT=IO_Stat_Number) I
    10 FORMAT(I3)
    PRINT *,' iostat=',IO_Stat_Number
    PRINT *,I
    IF (IO_Stat_Number==0) EXIT
  END DO
END PROGRAM ch1402

