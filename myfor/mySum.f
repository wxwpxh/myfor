      program mySum
      real sum
      integer i
      sum=0.0
      do 10 i=1, 100
            if (mod(i,2) .EQ. 0) then
                  sum=sum-1.0/i
            else
                  sum=sum+1.0/i
 10   end if
      print *,sum
      end
