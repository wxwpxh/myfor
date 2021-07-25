C  gfortran -o selstm selstm.for 
C  f95 -o selstm selstm.for     	    	
       PROGRAM MAIN  
       read(*,*) x
       if (x.le.2) then
           y=2*x+3
       else
           y=x+5
       endif
           write(*,*)'x=',x,'y=',y
       end
