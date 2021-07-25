C   pi/2=1+1/3+1/3*2/5+1/3*2/5*3/7+1/3*2/5*3/7*4/9+...
      PROGRAM mypi3
      integer n,i
      DOUBLE PRECISION  sum,s1,s2,pi
      PRINT *, 'input an integer:'
      READ (*,*)n
      sum=1.0
      s1=1.0/3.0
      s2=s1
      DO 10 i=1,n
        s2=s2*(i*2)/(i*4+1)
        sum=sum+s1+s2
        s1=s2*(i*2+1)/(i*4+3)
        s2=s1
  10  CONTINUE
      pi=2.0*sum
      write(*,*)'PI=',pi
      end
