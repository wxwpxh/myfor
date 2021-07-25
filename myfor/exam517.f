C sum=1-1/2+1/3-1/4....+1/99-1/100
      PROGRAM exam517
      integer SIGN
      real sum,deno,term
      sum = 1.0
      deno= 2.0
      SIGN = 1
  10  SIGN = (-1)*SIGN
      term = SIGN/deno
      sum  = sum+term
      deno = deno+1
      if (deno .le.100.0) goto 10
      print*,sum
      END
