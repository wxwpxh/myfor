C
C   helloworld.f
C   gfortran helloworld.f -o helloworld
C   f77 helloworld.f -o helloworld
      PROGRAM HELLOWORLD
      WRITE(*,10)
   10 FORMAT('hello, world')
      OPEN(unit=16, file='results.txt')
      WRITE(16,10)
      END PROGRAM HELLOWORLD
