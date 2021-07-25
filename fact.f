C     n!
      PROGRAM fact
      integer n,m,i
      read *,n
	  i=1
      m=1
      do 100 while (i.le.n) 
        m=m*i
        i=i+1
 100  continue
      write(*,*) 'factorial =', m
      end