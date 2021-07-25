      program mymath
c     double   real
      double precision a,b
      COMPLEX C1
          
      a=11111.1
      b=1111.11
      C1=CMPLX(1.0,2.0 )
      print *,a*b
      print *,sin(1.0)
      print *,asin(1.0)
      print *,log(3.0)
      print *,int(8.6)
      print *,mod(8,3)
      print *,sign(8.5,-2.0)
      print *,max(1.0,3.0,9.0,11.0,22.0,100.0)
      print *,max(1,2**10,9,11,22,100)
      print *,min(1,3,9,11,22,100)
      print *,0.001+123456.0-123455.0
      print *,123456.0-123455.0+0.001
      print *,1.0/3.0*3.0
      print *,1,2
      print *,sqrt(4.0),sqrt(9.0)
      print *,sqrt(a),sqrt(b)
      write(*,*) '123456789012345678901234567890'
      print *,LOG10(1000.0)
      print *,exp(C1)
      end
