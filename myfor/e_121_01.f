      PROGRAM Example1
      REAL a, b, av1, av2
      write(*,*) 'input two number:a,b'
      READ (*,*) a, b
      av1 = (a + b)/2
      av2 = sqrt(a*b)
      WRITE(*,*) av1, av2
      END
