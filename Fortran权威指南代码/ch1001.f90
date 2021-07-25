PROGRAM ch1001
!
! This program is a simple variant of ch0902.
! The array is now allocatable
! and the user is prompted for the
! number of people at run time.
!
IMPLICIT NONE
INTEGER :: Number_Of_People
REAL ::  Total = 0.0, Average = 0.0
INTEGER :: Person
REAL , DIMENSION(:) , ALLOCATABLE :: Weight
  PRINT *,' How many people?'
  READ *,Number_Of_People
  ALLOCATE(Weight(1:Number_Of_People))
  DO Person=1,Number_Of_People
    PRINT *, ' Type in the weight for person ',Person
    READ *,Weight(Person)
    Total = Total + Weight(Person)
  ENDDO
  Average = Total / Number_Of_People
  PRINT *,' The total of the weights is ',Total 
  PRINT *,' Average Weight is ',Average
  PRINT *,' ',Number_of_People,' Weights were '
  DO Person=1,Number_Of_People
    PRINT *,Weight(Person)
  ENDDO
END PROGRAM ch1001

