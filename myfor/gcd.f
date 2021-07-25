      PROGRAM gcd
      INTEGER M, N, R
      PRINT *,'input 2 int:'
      READ *, M, N
          R=MOD(M, N)
  10  if (R .NE. 0) then
          M=N
          N=R
          R=MOD(M, N)
          goto 10
          endif
      PRINT *,'THE GREATEST COMMON DIVISOR IS:', N

      END
