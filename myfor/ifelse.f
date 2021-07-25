C ********************** 
C IFELSE 
C **********************
      PROGRAM IFELSE
      INTEGER MARK
      MARK=60
      IF (MARK.GE.70) THEN
        WRITE(*,*) 'A'
      ELSE IF (MARK.GE.55) THEN
        WRITE(*,*) 'B'
      ELSE IF (MARK.GE.40) THEN
        WRITE(*,*) 'C'
      ELSE
        WRITE(*,*) 'F'
      ENDIF
      STOP
      END
