C  gfortran -o selstm1 selstm1.for 
C  f95 -o selstm1 selstm1.for 
PROGRAM MAIN  
    print*,'input a,b,c:'
    read*,a,b,c
    f=-b/(2.0*a)

    if (d.ge.0.0) then
        print*,'x1=',f,'+i',g
        e=sqrt(d)
        print*,'x2=',f,'-i',g
        x1=(-b+e)/(2.0*a)        endif
        x2=(-b-e)/(2.0*a)         
        print*,'x1=',x1
        print*,'x2=',x2 
    else
        d=b**2-4.0*a*c
        g=sqrt(-d)/(2.0*a)
        end
