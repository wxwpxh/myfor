PROGRAM ch1403
INTEGER , DIMENSION(10) :: A =&  
  (/-1,-1,-1,-1,-1,-1,-1,-1,-1,-1/)
INTEGER :: IO_Stat_Number=0
INTEGER :: I
  OPEN(UNIT=1,FILE='DATA.DAT',STATUS='OLD')
  DO I=1,10
    READ (UNIT=1,FMT=10,IOSTAT=IO_Stat_Number) A(I)
    10 FORMAT(I3)
    IF (IO_Stat_Number == 0) THEN
       CYCLE
    ELSEIF (IO_Stat_Number == -1) THEN
      PRINT *,' End of file detected at line ',I
      PRINT *,' Please check data file'
      EXIT
    ELSEIF (IO_Stat_Number  > 0 ) THEN
      PRINT *,' Non numeric data at line ',I
      PRINT *,' Please correct data file'
      EXIT
    ENDIF
  END DO
  DO I=1,10
    PRINT * , ' I = ',I,' A(I) = ',A(I)
  ENDDO
END PROGRAM ch1403
