C     leap year
      Program leapYear
      integer year
      year=0
      print *,'input an integer---year'
      read *,year
      if ( MOD(year,4) .EQ. 0) then
            if (MOD(year,100) .NE. 0)  then
               print *,year,'is leap Year,1'
            else
               print *,year,'not leap Year,1'
            endif
      else
            if (MOD(year,400) .EQ. 0) then
                  print *,year,"is leap Year,2"
            else
                  print *,year,'not leap Year,2'
            endif
      endif
      end
