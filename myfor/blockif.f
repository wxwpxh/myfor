C ********************** 
C Block IF 
C **********************
      PROGRAM BLOCKIF
      INTEGER X
      X=5
      IF (X.GT.10) THEN
        WRITE(*,*) X
        WRITE(*,*)' is greater than 10'
      ENDIF
      IF (X.LT.10) THEN
        WRITE(*,*) X
        WRITE(*,*)' is less than 10'
      ENDIF
      X=15
      IF (X.GT.10) THEN
        WRITE(*,*) X
        WRITE(*,*)' is greater than 10'
      ENDIF
      IF (X.LT.10) THEN
        WRITE(*,*) X
        WRITE(*,*)' is less than 10'
      ENDIF
      STOP
      END
