      PROGRAM Sum2
      integer i, n, sum

      sum = 0
          n=20
      do 10 i = 1, n
         sum = sum + i
         write(*,*) 'i =', i
         write(*,*) 'sum =', sum
  10  continue

      END
