C  gfortran -o area area.for 
C  f95 -o area area.for     	    	
        PROGRAM MAIN  
        parameter(r=0.5,pi=3.14159)  
        s=pi*r**2 
        h=2.0*pi*r
        print*,s,h
        end

