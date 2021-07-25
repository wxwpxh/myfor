C *********** 
C TYPECONV 
C ***********
      PROGRAM TYPECONV 
C INT -> REAL
      WRITE(*,*) FLOAT(5)
      WRITE(*,*) REAL(5) 
C REAL -> INT
      WRITE(*,*) INT(5.0E0) 
C INT -> DOUBLE
      WRITE(*,*) DBLE(5) 
      WRITE(*,*) DBLE(5.0E-5)     
C DOUBLE -> INT
      WRITE(*,*) INT(5.0D0)
C FLOAT -> DOUBLE
      WRITE(*,*) DBLE(5.0E0) 
C DOUBLE -> FLOAT
      WRITE(*,*) REAL(5.0D0)
      STOP
      END
