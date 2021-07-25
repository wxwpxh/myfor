REAL FUNCTION etox(X)
IMPLICIT NONE
REAL :: Term
REAL , INTENT(IN) :: X
INTEGER :: Nterm 
REAL , PARAMETER ::Tol = 1.0E-6 
  etox=1.0
  Term=1.0
  Nterm=0 
  DO
    Nterm = Nterm +1
    Term =( X / Nterm) * Term
    etox = etox + Term 
    IF(ABS(Term) <= Tol)EXIT
  END DO
END FUNCTION etox

program ch1606
implicit none
real :: etox
real , parameter :: x=1.0
real :: y
  print *,' Fortran intrinsic ',exp(x)
  y=etox(x)
  print *,' User defined etox ',y
end program ch1606


