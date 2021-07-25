C MAIN PROGRAM
      PROGRAM Sum
      integer n, sum
      sum = 0
      n = 0
  10  n = n+1
      sum = sum + n
      if (n .lt.100) goto 10
      print*,sum
      END
