PROGRAM ch1605
IMPLICIT NONE
! this program picks up the first occurrence 
! of a number in a list.
! a sentinel is used, and the array is 1 more 
! than the max size of the list.
INTEGER , ALLOCATABLE , DIMENSION(:) :: A
INTEGER :: Mark 
INTEGER :: I,Howmany
  OPEN (UNIT=1,FILE='DATA')
  PRINT *,' What number are you looking for?'
  READ  *, Mark
  PRINT *,' How many numbers to search?'
  READ  *,Howmany
  ALLOCATE(A(1:Howmany+1))
  READ(UNIT=1,FMT=*) (A(i),I=1,Howmany)
  I=1 
  A(Howmany+1)= Mark 
  DO WHILE(Mark /= A(I))
    I=I+1
  END DO
  IF(I == (Howmany+1)) THEN 
    PRINT*,' ITEM NOT IN LIST'
  ELSE
    PRINT*,' ITEM IS AT POSITION ',I 
  ENDIF
END PROGRAM ch1605


