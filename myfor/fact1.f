C  1!+2!+....+n!
      PROGRAM fact1
      integer n,sum,fact,I        
      read *,n
      sum=0.0
      fact=1.0
      do 100 I=1,n
        fact=fact*I
        sum=sum+fact
 100  continue
      write(*,*) 'factorial =', sum
      end
