PROGRAM ch2601
!
! This program reads the non-zero elements of 
! two sparse vectors x and y together with their
! indices, and stores them in two linked lists.
! Using these linked lists it then calculates
! and prints out the inner product.
! It also prints the values.
!
! updated 21/3/00 to initialise pointers to
! be disassociated using intrinsic function NULL
! plus minor updates
!
  IMPLICIT NONE
  CHARACTER (LEN=30):: Filename
  TYPE sparse_vector
  INTEGER :: index
  REAL:: value
  TYPE (sparse_vector), POINTER ::next=> NULL ( )
  END TYPE sparse_vector
  TYPE(sparse_vector), POINTER ::   Root_x,Current_x, &
                    Root_y,Current_y
  REAL :: Inner_prod=0.0
  INTEGER::IO_status
!
! Read non-zero elements of vector x together
! with indices into a linked list
!
  PRINT *,'input file name for vector x'
  READ '(A)',Filename
  OPEN(UNIT=1 , FILE=Filename , STATUS='OLD' &
  , IOSTAT=IO_status)
  IF(IO_status /= 0)THEN
    PRINT*,'Error opening file ',Filename
    STOP
  ENDIF
  ALLOCATE(Root_x)
  READ (UNIT=1 , FMT=* , IOSTAT=IO_status) &
    Root_x%value,Root_x%index
  IF(IO_status /= 0) THEN
    PRINT*,' Error when reading from file ' &
    , Filename, ' or file empty'
    STOP
  ENDIF
!
! Read data for vector x from file until eof
!
  Current_x => Root_x
  ALLOCATE(Current_x%next)
  DO WHILE(ASSOCIATED(Current_x%next))
    Current_x => Current_x%next
    READ (UNIT=1,FMT=*,IOSTAT=IO_status) &
      Current_x%value, Current_x%index
    IF(IO_status == 0)THEN
      ALLOCATE(Current_x%next)
      CYCLE
    ELSEIF(IO_status > 0 )THEN
!
! Error on reading
!
      PRINT * ,'Error occurred when reading from ' &
             , Filename
      STOP
    ELSE
!
! End of file
!
      NULLIFY (Current_x%next)
    END IF
  END DO

  CLOSE(UNIT=1)
!
! Read non-zero elements of vector y together 
! with indices into a linked list
!
  PRINT *,'input file name for vector y'
  READ '(A)',Filename
  OPEN(UNIT=1 , FILE=Filename , STATUS='OLD' &
   , IOSTAT=IO_status)
  IF(IO_status /= 0)THEN
    PRINT*,'Error opening file ',Filename
    STOP
  ENDIF
  ALLOCATE(Root_y)
  READ (UNIT=1 , FMT=* , IOSTAT=IO_status) &
     Root_y%value,Root_y%index
  IF(IO_status /= 0) THEN
    PRINT*,' Error when reading from ' &
      , Filename, ' or file empty'
    STOP
  ENDIF
!
! Read data for vector y from file until eof
!
  Current_y => Root_y
  ALLOCATE(Current_y%next)
  DO WHILE(ASSOCIATED(Current_y%next))
    Current_y => Current_y%next
    READ (UNIT=1 , FMT=* , IOSTAT=IO_status) &
      Current_y%value, Current_y%index
    IF(IO_status == 0)THEN
      ALLOCATE(Current_y%next)
      CYCLE
    ELSEIF(IO_status > 0 )THEN
!
! Error on reading
!
      PRINT * , 'Error occurred when reading from' &
        , Filename
      STOP
    ELSE
!
! End of file
!
      NULLIFY (Current_y%next)
    END IF
  END DO
!
! Data has now been read and stored in 2 linked lists
! start at the beginning of x linked list and
! y linked list and compare indices
! in order to perform inner product
!
  Current_x => Root_x
  Current_y => Root_y
  DO WHILE (ASSOCIATED(Current_x%next))
    DO WHILE (Associated(Current_y%next) &
     .AND. Current_y%index < Current_x%index)
!
! move through 2nd list
!
      Current_y => Current_y%next
    END DO
!
! At this point Current_y%index >= Current_x%index 
! or 2nd list is exhausted
!
    IF (Current_y%index == Current_x%index) THEN
      Inner_prod = Inner_prod &
        + Current_x%value * Current_y%value
    END IF
    Current_x => Current_x%next
  END DO
!
! Print out inner product
!
  PRINT *,'Inner product of two sparse vectors is :' &
    , Inner_prod
!
! Print non-zero values of vector x and indices 
!
  PRINT*, 'non-zero values of vector x and indices:'
  Current_x => Root_x
  DO WHILE (ASSOCIATED(Current_x%next))
    PRINT*,Current_x%value,Current_x%index
    Current_x => Current_x%next 
  END DO
!
! Print non-zero values of vector y and indices 
!
PRINT*, 'non-zero values of vector y and indices:'
  Current_y => Root_y
  DO WHILE (ASSOCIATED(Current_y%next))
    PRINT*,Current_y%value,Current_y%index
    Current_y => Current_y%next
  END DO
!
END PROGRAM ch2601