C MAIN PROGRAM
      integer I
      REAL T
      T=1.0
      I=2
  10  if (I .LE. 5) then
        T=T*I
        I=I+1
        goto 10
      endif
      PRINT *, T
      END
