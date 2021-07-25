        SUBROUTINE BRMUL(A,B,M,N,K,C)
        DIMENSION A(M,N),B(N,K),C(M,K)
        DOUBLE PRECISION A,B,C
        DO 50 I=1,M
        DO 50 J=1,K
          C(I,J)=0.0
          DO 10 L=1,N
            C(I,J)=C(I,J)+A(I,L)*B(L,J)
10        CONTINUE
50      CONTINUE
        RETURN
        END
