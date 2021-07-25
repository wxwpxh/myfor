PROGRAM ch1603
IMPLICIT NONE
!
! Simple case statement example
!

INTEGER :: I,J,K
CHARACTER :: Operator
  DO
    PRINT *,' Type in two integers'
    READ *, I,J
    PRINT *,' Type in operator'
    READ '(A)',Operator
    Calculator : &
    SELECT CASE (Operator)
      CASE ('+') Calculator
        K=I+J
        PRINT *,' Sum of numbers is ',K
      CASE ('-') Calculator
        K=I-J
        PRINT *,' Difference is ',K
      CASE ('/') Calculator
        K=I/J
        PRINT *,' Division is ',K
      CASE ('*') Calculator
      K=I*J
      PRINT *,' Multiplication is ',K
    CASE DEFAULT Calculator
      EXIT
    END SELECT Calculator
  END DO
END PROGRAM ch1603


