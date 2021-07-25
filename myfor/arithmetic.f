C *********** 
C ARITHMETIC 
C ***********
      PROGRAM ARITHMETIC
C integer arithmetic
      WRITE(*,*) 'integer arithmetic'
      WRITE(*,*) 5+4
      WRITE(*,*) 5-4
      WRITE(*,*) 5*4
      WRITE(*,*) 5/4
      WRITE(*,*) 5**4 
C real arithmetic
      WRITE(*,*) 'real arithmetic'
      WRITE(*,*) 5.0+4.0
      WRITE(*,*) 5.0-4.0
      WRITE(*,*) 5.0*4.0
      WRITE(*,*) 5.0/4.0
      WRITE(*,*) 5.0**4.0
C complex arithmetic
      WRITE(*,*) 'complex arithmetic'
      WRITE(*,*) (2.0,5.0)+(1.0,-1.0)
      WRITE(*,*) (2.0,5.0)-(1.0,-1.0)
      WRITE(*,*) (2.0,5.0)*(1.0,-1.0)
      WRITE(*,*) (2.0,5.0)/(1.0,-1.0)
      WRITE(*,*) (2.0,5.0)**(1.0,-1.0)
      STOP
      END
