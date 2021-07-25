      PROGRAM mul99
      DO 10, I=1, 9
        DO 20, J=1, I
            K=I*J
            PRINT *, I, '*', J, '=', K
20      CONTINUE
      PRINT *,' '
10    CONTINUE
      END
