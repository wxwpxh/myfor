      PROGRAM mysin1
      PRINT *, 'input an integer & angle:'
      READ (*,*),n,x
      write(*,*)sinx(n,x)
      end

C   n!
      function k(n)
      k=1
      i=2
5     if (i.le.n) then
        k=k*i
        i=i+1
        goto 5
      endif
      return
      end

C   sin(x)=x-x*x/3!+x*x*x/5!...
      function sinx(n,x)
      DOUBLE PRECISION s,x1,PI
      integer i
      PI=3.14159265
      x1=x*PI/180
      s=0.0
      do 10 i=1, n
10      s=s+(-1)**(i-1)*(x1**(2*i-1))/k(2*i-1)
      sinx=s
      return
      end
