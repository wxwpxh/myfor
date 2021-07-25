!gfortran ex42.f90 -o ex42
!gcc ex42.f90 -o ex42  -lgfortran 
PROGRAM LOOP
  INTEGER P,K
  P=1
  DO K=5,1,-1
     P=P*K
  END DO
  PRINT *,P
END


