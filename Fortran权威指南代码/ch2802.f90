PROGRAM ch2802
IMPLICIT NONE

INTERFACE
  FUNCTION Running_Average(R,How_Many) RESULT(Rarray)
    IMPLICIT NONE
    INTEGER , INTENT(IN) :: How_Many
    REAL , ALLOCATABLE , DIMENSION (:) , &
      INTENT(IN) :: R
    REAL , ALLOCATABLE , DIMENSION(:) :: Rarray
  END FUNCTION Running_Average
END INTERFACE

INTERFACE 
  SUBROUTINE Read_Data(File_Name,Raw_Data,How_Many)
    IMPLICIT NONE
    CHARACTER (LEN=*) , INTENT(IN) :: File_Name
    INTEGER , INTENT(IN) :: How_Many
    REAL , INTENT(OUT) , ALLOCATABLE , &
     DIMENSION(:) :: Raw_Data
  END SUBROUTINE Read_Data        
END INTERFACE

INTEGER :: How_Many
CHARACTER (LEN=20) :: File_Name
REAL , ALLOCATABLE , DIMENSION(:)  :: Raw_Data
REAL , ALLOCATABLE , DIMENSION(:)  :: RA
INTEGER :: I
  PRINT * , ' How many data items are there?'
  READ  * , How_Many
  PRINT * , ' What is the file name?'
  READ '(A)',File_Name 
  CALL Read_Data(File_Name,Raw_Data,How_Many)
  ALLOCATE(RA(1:How_Many))
  RA=Running_Average(Raw_Data,How_Many)
  DO I=1,How_Many
    PRINT *,Raw_Data(I),'   ' ,RA(I)
  END DO
END PROGRAM ch2802

FUNCTION Running_Average(R,How_Many) RESULT(Rarray)
INTEGER , INTENT(IN) :: How_Many
REAL , INTENT(IN) , ALLOCATABLE , DIMENSION(:) :: R
REAL , ALLOCATABLE , DIMENSION(:) :: Rarray
INTEGER :: I
REAL :: Sum=0.0
  ALLOCATE(Rarray(1:How_Many))
  DO I=1,How_Many
    Sum = Sum + R(I)
    Rarray(I)=Sum/I
  END DO
END FUNCTION Running_Average

SUBROUTINE Read_Data(File_Name,Raw_Data,How_Many)
IMPLICIT NONE
CHARACTER (LEN=*) , INTENT(IN) :: File_Name
INTEGER , INTENT(IN) :: How_Many
REAL , INTENT(OUT) , ALLOCATABLE , &
  DIMENSION(:) :: Raw_Data
INTEGER :: I
  ALLOCATE(Raw_Data(1:How_Many))
  OPEN(FILE=File_Name,UNIT=1)
  DO I=1,How_Many
    READ (UNIT=1,FMT=*) Raw_Data(I)
  ENDDO
END SUBROUTINE Read_Data