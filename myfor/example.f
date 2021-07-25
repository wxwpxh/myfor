C     example.f
      program example
      DOUBLE PRECISION a,b,c,d,e,PI
      PI=3.14159265

      read(*,*)a,b
      c=sin(a)+LOG10(abs(b))
      d=exp(a)+tan(30.0*PI/180.0)
      e=c/d
      write(*,10) e
  10  format (1x,F7.3)
      end
