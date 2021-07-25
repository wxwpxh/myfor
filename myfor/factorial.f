       PROGRAM main
       j=k(3)
       l=k(6)
       m=k(9)
       write(*,*)j,l,m,k(0),k(1)
       end

C      subfunction
       function k(n)
       k=1
       i=2
5      if (i.le.n) then
                k=k*i
                i=i+1
                goto 5
       endif
       return
       end
