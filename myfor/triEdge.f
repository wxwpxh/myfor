C The Law of Cosines 
      PROGRAM triEdge
      REAL A1,B1,ALFA1
      READ(*,*)A1,B1,ALFA1        
      WRITE(*,*) 'opposite side= ',C(A1,B1,ALFA1)
      END
          
C  given two  edge and it's Included angle  obtain the opposite side 
      FUNCTION C(A,B,ALFA)
      REAL A,B,ALFA,ALFA1,D,PI
      PI=3.14159265
      ALFA1=ALFA*PI/180
      D=A*A+B*B-2.0*A*B*cos(ALFA1)
      C=SQRT(D)
      END
