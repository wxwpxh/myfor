C *********** 
C LOGEXP 
C ***********
      PROGRAM LOGEXP 
C LOG returns the logarithm (base e) of its argument 
C  it may be applied to double precision and complex arguments
      WRITE(*,*) LOG(100.0)
      WRITE(*,*) LOG(100.0D0)
      WRITE(*,*) LOG((3.0,4.0))
      WRITE(*,*) LOG((3.0D0,4.0D0)) 
C LOG10 returns the logarithm (base 10) of its argument 
C  it may be applied to double precision but not complex arguments
      WRITE(*,*) LOG10(100.0)
      WRITE(*,*) LOG10(100.0D0) 
C EXP returns e to the power of its argument 
C  it may be applied to double precision and complex arguments
      WRITE(*,*) EXP(2.0)
      WRITE(*,*) EXP(2.0)
      WRITE(*,*) EXP(2.0D0)
      WRITE(*,*) EXP((3.0,4.0))
      WRITE(*,*) EXP((3.0D0,4.0D0))
      STOP
      END
