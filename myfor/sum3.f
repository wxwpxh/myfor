C MAIN PROGRAM
      PROGRAM Sum3
      integer n, sum

      sum = 0
      n = 1
  10  if (n .le. 20) then
        sum = sum + n
        n = n+1
        write(*,*) 'sum =', sum
        goto 10
      endif

      END
