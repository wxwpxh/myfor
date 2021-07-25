C ***********
C WHOLE
C ***********
      PROGRAM WHOLE
C INT - Truncate to integer
      WRITE(*,*) INT(5.3)
      WRITE(*,*) INT(5.8)
      WRITE(*,*) INT(-3.2)
      WRITE(*,*) INT(-3.9)
C AINT - Truncate to real
      WRITE(*,*) AINT(5.3)
      WRITE(*,*) AINT(5.8)
      WRITE(*,*) AINT(-3.2)
      WRITE(*,*) AINT(-3.9)
C NINT - Round to integer
      WRITE(*,*) NINT(5.3)
      WRITE(*,*) NINT(5.8)
      WRITE(*,*) NINT(-3.2)
      WRITE(*,*) NINT(-3.9)
      STOP
      END
