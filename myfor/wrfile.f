      PROGRAM HELLO
      WRITE(*,10)
   10 FORMAT('hello, world')
      OPEN(unit=16, file='results.txt')
      WRITE(16,10)
      END
