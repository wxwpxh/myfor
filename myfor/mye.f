C   e=1+1/1!+1/2!+1/3!+ ...
      PROGRAM mye
      integer n,i
      DOUBLE PRECISION  sum
      PRINT *, 'input an integer <= 30:'
      READ (*,*)n
      sum=1.0
      DO 10 i=1,n
        sum=sum+1.0/k(i)
  10  CONTINUE
      write(*,*)'e=',sum
      end

C     subfunction
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
