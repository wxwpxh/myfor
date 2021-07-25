C   PI=4*(1-1/3+1/5-1/7...)
      PROGRAM mypi2
      integer n,i
      DOUBLE PRECISION  sum,pi
      PRINT *, 'input an integer:'
      READ (*,*)n
      sum=0.0
      DO 10 i=1,n
        sum=sum+(-1.0)**(i-1)/(2*i-1)
  10  CONTINUE
      pi=4.0*sum
      write(*,*)'PI=',pi
      end
