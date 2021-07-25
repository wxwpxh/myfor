PROGRAM ch2606
IMPLICIT NONE
INTEGER::I, N
REAL, ALLOCATABLE, DIMENSION(:,:) :: A
REAL, ALLOCATABLE, DIMENSION(:):: Adiag
LOGICAL:: OK
CHARACTER(LEN=20)::Filename

INTERFACE
  SUBROUTINE Matrix_Diagonal (A, Diag, N, OK)
    IMPLICIT NONE
    REAL, INTENT(IN), DIMENSION(:,:) ::A
    REAL, INTENT(OUT), DIMENSION(:) :: Diag
    INTEGER, INTENT(IN) ::N
    LOGICAL, INTENT(OUT):: OK
  END SUBROUTINE Matrix_Diagonal
END INTERFACE

  PRINT*,'input name of data file'
  READ '(A)',Filename
  OPEN(UNIT=1,FILE=Filename)
  READ(1,*) N
  ALLOCATE(A(1:N,1:N), Adiag(1:N))
  DO I=1,N
    READ(1,*)A(I,1:N)
  END DO
  CALL Matrix_Diagonal(A,Adiag,N, OK)
  IF(OK) THEN
    PRINT*,' Diagonal elements of A are:'
    PRINT *,Adiag
  ELSE
    PRINT*,'Matrix A is not square'
  END IF
END PROGRAM ch2606
