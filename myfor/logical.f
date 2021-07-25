C *********** 
C Logical 
C ***********
      PROGRAM LOGICAL
      WRITE(*,*) .NOT.(.TRUE.)
      WRITE(*,*) .NOT.(.FALSE.)
      WRITE(*,*)
      WRITE(*,*) (.TRUE.).AND.(.TRUE.)
      WRITE(*,*) (.TRUE.).AND.(.FALSE.)
      WRITE(*,*) (.FALSE.).AND.(.TRUE.)
      WRITE(*,*) (.FALSE.).AND.(.FALSE.)
      write(*,*)
      WRITE(*,*) (.TRUE.).OR.(.TRUE.)
      WRITE(*,*) (.TRUE.).OR.(.FALSE.)
      WRITE(*,*) (.FALSE.).OR.(.TRUE.)
      WRITE(*,*) (.FALSE.).OR.(.FALSE.) 
      STOP
      END
