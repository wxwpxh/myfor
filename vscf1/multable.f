C    multiplication table
      PROGRAM multable    
      integer m(9,9)
      do 10 i=1,9
        do 10 j=1,9
          m(i,j)=i*j
10    continue
      do 20 i=1,9
        write(*,100) (i,'*',j,'=',m(i,j),j=1,i)
100   format(1x,9(1x,i1,a1,i1,a1,i2))
20    continue
      end
