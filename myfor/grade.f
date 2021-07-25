c print score grade
      Program grade
      print *,'input your score:'
      read(*,*) score
      if (score.ge.60.0) then
        print *,'pass!'
      else
        print *,'failed!'
      end if
      end
