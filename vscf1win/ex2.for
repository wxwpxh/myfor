      Program ex2
      real x,y,z,areaofcircle
      x=90.5
      y=87.0
      z=60.5
      print *,'r=',x,'area of circle=',areaofcircle(x)
      print *,'r=',y,'area of circle=',areaofcircle(y)
      print *,'r=',z,'area of circle=',areaofcircle(z)
      end
    
      function  areaofcircle(r)
      real r ,areaofcircle
      areaofcircle=3.1415926*r**2
      return 
      end