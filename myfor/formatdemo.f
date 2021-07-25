      PROGRAM formatdemo
      REAL x
      x = 0.025
      write(*,100) 'x=', x
  100 format (A,F)
      write(*,110) 'x=', x
  110 format (A,F5.3)
      write(*,120) 'x=', x
  120 format (A,E)
      write(*,130) 'x=', x
  130 format (A,E8.1)
      write (*,999) x
  999 format ('The answer is x = ', F8.3)
      END
