C f77 ex2fmt.f -o ex2fmt
C MAIN PROGRAM
      PROGRAM ex2fmt
      PRINT 100, 1.0, Circumference(1.0), area(1.0)
      PRINT 100, 3.0, Circumference(3.0), area(3.0)
      PRINT 100, 12.0, Circumference(12.0), area(12.0)
      PRINT 100, 5.0, Circumference(5.0), area(5.0)
  100 format ('radius=', F6.2, ' Circum =', F8.4, ' area =', F8.4)        
      END

  
C SUB FUNCTION
      FUNCTION Circumference(R)
      PI=3.1415926
      Circumference=2*PI*R
      RETURN
      END 
          
C sub FUNCTION
      FUNCTION  area(R)
      PI=3.1415926        
      area=PI*R**2
      end
