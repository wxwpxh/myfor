       PROGRAM fbnc
       DOUBLE PRECISION A, B, C
       A=1.0D0
       B=1.0D0
       DO 10, I=1, 20, 1
         A=B
         B=C
         C=A+B
         PRINT *, 'fbnc',I-1, '=' ,C
10     CONTINUE
       END
