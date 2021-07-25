C *********** 
C MAXMIN 
C ***********
      PROGRAM MAXMIN 
C MAX
      WRITE(*,*) MAX(1,3)
      WRITE(*,*) MAX(1,3,2)
      WRITE(*,*) MAX(1,3,2,-4)
      WRITE(*,*) MAX(1,3,2,-4,3.5)
C MIN
      WRITE(*,*) MIN(1,3)
      WRITE(*,*) MIN(1,3,2)
      WRITE(*,*) MIN(1,3,2,-4)
      WRITE(*,*) MIN(1,3,2,-4,3.5)
      STOP
      END
