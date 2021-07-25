      program myarray
      double precision  a(1:100)
      double precision b(1:3,4:6)
      integer i
c     dimension b(1:3,4:6)!same as pre
c     double precision b
      DATA C,D,E,F/-1.0,2.0,3.0,4.0/
      DATA G/2.0/,H/3.0/

      do 10 ,i=1,100
            a(i)=i**2
c                   print *,a(i)
   10 continue
      print *,a(100)
      end
