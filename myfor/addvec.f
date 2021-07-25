C Subroutines demo 2
      PROGRAM ADDVEC
      REAL*4 A(2),B(2),C(2)
      DATA (A(I),I=1,2) / 2, 3 /
      DATA (B(I),I=1,2) / 4, 5 /
C A(1)=2.0 A(2)=3.0 B(1)=4.0  B(2)=5.0 
      CALL ADD2(A,B,C)
      WRITE(*,*) C
      END 

C Subroutine ADD2 returns the sum of two 2-vectors
      SUBROUTINE ADD2(A,B,C)
      REAL*4 A(2),B(2),C(2)
      C(1)=A(1)+B(1)
      C(2)=A(2)+B(2)
      END
