C MAIN PROGRAM
      PROGRAM fact5
      integer I
      REAL T
      T=1.0
      I=2
      DO 10, UNTIL (I .GT. 5)
        T=T*I
        I=I+1
10        CONTINUE
      PRINT *, T
      END
