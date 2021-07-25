C Arrays
C The program and output demonstrate the setting up and print out of arrays.
C Note the used of the DATA statement to input data into an array.
      PROGRAM ARRAYS
      INTEGER      N(2) 
      REAL*4       A(2,2)
      LOGICAL      L(3)
      COMPLEX*16   C(2)
      INTEGER      I,J
      DATA (N(I),I=1,2) / 5, -7 /
      DATA ((A(I,J), I=1,2), J=1,2) / 3.2, -2.5, 0.0, 1.3 /
      DATA (L(I),I=1,3) / .TRUE., .FALSE., .TRUE. /
C      DATA (C(I),I=1,2) / DCMPLX(2,3), DCMPLX(-3,2) / 
      C(1)=DCMPLX(2,3)
      C(2)=DCMPLX(-3,2)
      WRITE (*,*) N 
      WRITE (*,*) A 
      WRITE (*,*) L 
      WRITE (*,*) C 
          
      print *, "Accessing Arrays--------"
      WRITE (*,*) N(2)
      WRITE (*,*) A(1,2),A(2,2) 
      WRITE (*,*) C(1),C(2)

      END
