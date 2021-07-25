      program encrypt
      CHARACTER*80 LINE1, LINE2
      CHARACTER L1, L2
      READ *, LINE1
      DO 10, K=1, 80
        L1=LINE1(K:K)
        IF ((LGE(L1,`A`).AND.LLE(L1,`Z`)).OR.
     $(LGE(L1,`A`).AND.LLE(L1,`Z`))) THEN
          I=ICHAR(L1)
          J=I+5
          IF (J .GT. 122 .OR. (J .GT. 90 .AND. J .LT. 96)) THEN
          J=J-26
          L2=CHAR(J)
          LINE2(K:K)=L2
        ELSE
          LINE2(K:K)=L1
        ENDIF
10    CONTINUE
      PRINT *, LINE2
      END
