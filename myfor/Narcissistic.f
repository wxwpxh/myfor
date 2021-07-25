       program zy8
       integer i,a,b,c
       do 100 i=100,999
         a=i/100
         b=i/10-a*10
         c=mod(i,10)
         if ((a*a*a + b*b*b + c*c*c) .eq. i) then
           n=n+1
           write(*,'(I4,$)')i
         endif
100    CONTINUE
       end
