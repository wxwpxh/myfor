PROGRAM test_vector1
!
!  This program tests the vector class.
!
!  Record of revisions:
!      Date       Programmer          Description of change
!      ====       ==========          =====================
!    12/29/06    S. J. Chapman        Original code
!
USE vector_class                  ! Import vector class
IMPLICIT NONE

! Declare variables
REAL,DIMENSION(6) :: array        ! Array of data to load / save
INTEGER :: istat                  ! Allocate status
TYPE(vector),POINTER :: my_vec    ! Test object

! Create an object of type "vector" using the pointer
ALLOCATE( my_vec, STAT=istat )

! Save an array of data in this object.
array = (/ 1., 2., 3., 4., 5., 6. /)
!CALL my_vec%set_vector(array)
CALL set_vector_sub(my_vec,array)

! Retrieve the data from this vector.
array = 0
CALL get_vector_sub(my_vec,array)
WRITE (*,'(A,6F6.1)') 'vector = ', array

! Destroy this object
WRITE (*,*) 'Deallocating vector object ...'
CALL clean_vector_sub( my_vec)
DEALLOCATE( my_vec, STAT=istat )
   
END PROGRAM test_vector1
