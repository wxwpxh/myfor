      program arrayStudy
      double precision  a(1:10000) 
C     double precision b(1:3,4:6) 
      integer i   
C dimension b(1:3,4:6) 
C double precision b
      DATA C,D,E,F/-1.0,2.0,3.0,4.0/
      DATA G/2.0/,H/3.0/

      do 10 ,i=1,10000
            a(i)=i**2
C           print *,a(i)
   10 continue
      print *,a(10000)
      end
