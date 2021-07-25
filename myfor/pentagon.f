      PROGRAM pentagon
      write(*,*)'Input A,B,C,D,E,F,G'
      read(*,*) A,B,C,D,E,F,G
      S=(A+B+C)/2
      S1=SQRT(S*(S-A)*(S-B)*(S-C))
      S=(C+D+E)/2
      S2=SQRT(S*(S-C)*(S-D)*(S-E))
      S=(D+E+F)/2
      S3=SQRT(S*(S-D)*(S-E)*(S-F))
      AREA=S1+S2+S3
      write(*,*)'area=',area
      end
