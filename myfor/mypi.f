C   pi^2/6=1/1^2+1/2^2+1/3^2+ ...
      PROGRAM mypi
      integer n,i
      DOUBLE PRECISION  sum,pi
      PRINT *, 'input an integer:'
      READ (*,*)n
      sum=0.0
      DO 10 i=1,n
        sum=sum+1.0/(i*i)
  10  CONTINUE
      pi=sqrt(6.0*sum)
      write(*,*)'PI=',pi
      end
