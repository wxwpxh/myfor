C ************** 
C TRIG FUNCTIONS 
C **************
      PROGRAM TRIG 
C sin of 30deg, pi/6
      WRITE(*,*) SIN(0.523599) 
C cos of 30deg, pi/6
      WRITE(*,*) COS(0.523599) 
C tan of 30deg, pi/6
      WRITE(*,*) TAN(0.523599) 
C arcsin of 0.5
      WRITE(*,*) ASIN(0.5) 
C Sine of a complex number
      WRITE(*,*) SIN((3,4)) 
C Cosine of a complex number
      WRITE(*,*) COS((3,4))
          
C ************** 
C ATAN 
C ************** 
C Finding the angle to (1,1)
      WRITE(*,*) ATAN(1.0/1.0)
      WRITE(*,*) ATAN2(1.0,1.0) 
C Finding the angle to (-1.0,-1.0)
      WRITE(*,*) ATAN((-1.0)/(-1.0))
      WRITE(*,*) ATAN2(-1.0,-1.0)
      STOP
      END
