C ********************** 
C Conditional Branch - IF 
C **********************
      PROGRAM IF1
      INTEGER X
      X=5
      IF (X.GT.10) WRITE(*,*) '5 is greater than 10'
      IF (X.LT.10) WRITE(*,*) '5 is less than 10'
      X=15
      IF (X.GT.10) WRITE(*,*) '15 is greater than 10'
      IF (X.LT.10) WRITE(*,*) '15 is less than 10'
      STOP
      END
