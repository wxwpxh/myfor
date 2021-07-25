C     n!
      PROGRAM fact
      integer n,m,i
      read *,n
      i=1
      m=1
 10   continue    
      m=m*i
      i=i+1
      if (i.le.n) goto 10
      write(*,*) 'factorial =', m
      end
