C The Law of Cosines
      PROGRAM Cosines
      REAL A1,B1,C1,ALFA1
      READ(*,*)A1,B1,ALFA1
      C1=C(A1,B1,ALFA1)
      WRITE(*,*) 'opposite side= ',C1
      WRITE(*,*) 'side A opposite angel= ',ALFA(A1,B1,C1)         
      END

C  given two  edge and it's Included angle  obtain the opposite side
      FUNCTION C(A,B,ALFA)
      REAL A,B,ALFA,ALFA1,D,PI
      PI=3.14159265
      ALFA1=ALFA*PI/180
      D=A*A+B*B-2.0*A*B*cos(ALFA1)
      C=SQRT(D)
      END
          
C  given 3  edge3 and obtain the opposite angle
      FUNCTION ALFA(A,B,C)
      REAL A,B,C,D,PI
      PI=3.14159265
      D=(B*B+C*C-A*A)/(2*B*C)
      ALFA=ACOS(D)*180/PI
      END
