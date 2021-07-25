!gfortran ex41.f90 -o ex41
!gcc ex41.f90 -o ex41  -lgfortran 
program ex41
    INTEGER X 
  DO X=1,10,1
    PRINT *,X,SIN(X*1.0),COS(X*1.0)
  END DO
END program ex41

