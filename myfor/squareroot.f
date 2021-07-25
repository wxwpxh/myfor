C *********** 
C SQUAREROOT 
C ***********
      PROGRAM SQUAREROOT 
C SQRT returns the squareroot of its argument 
C The squareroot of a number is equivalent to it 
C  raised to a power of 0.5 
C Single precision SQRT of real number
      WRITE(*,*) SQRT(16.0)
      WRITE(*,*) 16.0**0.5 
C Double precision SQRT of real number
      WRITE(*,*) SQRT(16.0D0)
      WRITE(*,*) 16.0D0**0.5D0 
C Single precision SQRT of complex number
      WRITE(*,*) SQRT((1.0,1.0))
      WRITE(*,*) (1.0,1.0)**0.5  
C Double precision SQRT of complex number
      WRITE(*,*) SQRT((1.0D0,1.0D0))
      WRITE(*,*) (1.0D0,1.0D0)**0.5D0
      STOP
      END
