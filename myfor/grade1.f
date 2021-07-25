      Program grade1
      print *,'input your score:'
      read(*,*) g
      if(g.lt.60.0) then 
        print *,'failed!'
      else if(g.lt.70) then
        print *,'D'
      else if(g.lt.80) then
        print *,'C'
      else if(g.lt.90) then
        print *,'B'
      else
        print *,'A'
      endif
      end
