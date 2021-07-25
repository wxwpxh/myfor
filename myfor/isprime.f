      PROGRAM isprime
          integer N
          REAL J
      PRINT *, 'input an integer:'
      READ *, N
      J=SQRT(REAL(N))
      I=2
10        IF ((I .LE. J) .AND. (MOD(N, I) .NE. 0)) THEN
              I=I+1
              GOTO 10
      END IF

      IF (I .GT. J) THEN
              PRINT *, N, ' IS A PRIME NUMBER.'
      ELSE
              PRINT *, N, ' IS NOT A PRIME NUMBER.'
      END IF

      END
