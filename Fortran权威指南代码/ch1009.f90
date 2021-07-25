PROGRAM ch1009
! Variables used are
!    Mean - for the running mean
!    SSQ  - The running corrected sum of squares
!    X    - Input values for which
! mean and sd required
!    W    - Local work variable
!    SD   - Standard Deviation
!    R    - Another work variable
IMPLICIT NONE
REAL :: Mean=0.0,SSQ=0.0,X,W,SD,R
INTEGER :: I,N
  PRINT *,' ENTER THE NUMBER OF READINGS' 
  READ*,N 
  PRINT*,' ENTER THE ',N,' VALUES, ONE PER LINE'
  DO I=1,N
    READ*,X
    W=X-Mean
    R=I-1
    Mean=(R*Mean+X)/I
    SSQ=SSQ+W*W*R/I
  ENDDO
  SD=(SSQ/R)**0.5 
  PRINT *,' Mean is ',Mean
  PRINT *,' Standard deviation is ',SD
END PROGRAM ch1009


