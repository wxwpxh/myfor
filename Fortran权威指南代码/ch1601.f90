PROGRAM ch1601
IMPLICIT NONE
REAL :: A , B , C , Term , A2 , Root1 , Root2
!
!   a b and c are the coefficients of the terms 
!   a*x**2+b*x+c
!   find the roots of the quadratic, root1 and root2
!
  PRINT*,' GIVE THE COEFFICIENTS A, B AND C'
  READ*,A,B,C 
  Term = B*B - 4.*A*C
  A2 = A*2.
! if term < 0, roots are complex
! if term = 0, roots are equal
! if term > 0, roots are real and different
  IF(Term < 0.0)THEN
    PRINT*,' ROOTS ARE COMPLEX'
  ELSEIF(Term > 0.0)THEN
    Term = SQRT(Term)
    Root1 = (-B+Term)/A2
    Root2 = (-B-Term)/A2
    PRINT*,' ROOTS ARE ',Root1,' AND ',Root2
  ELSE
    Root1 = -B/A2
    PRINT*,' ROOTS ARE EQUAL, AT ',Root1
  ENDIF 
END PROGRAM ch1601

