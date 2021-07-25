PROGRAM ch0806
!
! Examples of the use of the kind 
! function and the numeric inquiry functions
!
! Integer arithmetic
! 
! 32 bits is a common word size,
! and this leads quite cleanly
! to the following
! 8 bit integers 
! -128 to 127 10**2
! 16 bit integers
! -32768 to 32767 10**4
! 32 bit integers
! -2147483648 to 2147483647 10**9
!
! 64 bit integers are increasingly available.
! This leads to
! -9223372036854775808 to 
!  9223372036854775807 10**19
!
! You may need to comment out some of the following
! depending on the hardware platform and compiler
! that you use.

INTEGER                     :: I
INTEGER ( SELECTED_INT_KIND( 2)) :: I1
INTEGER ( SELECTED_INT_KIND( 4)) :: I2
INTEGER ( SELECTED_INT_KIND( 9)) :: I3
INTEGER ( SELECTED_INT_KIND(10)) :: I4


! Real arithmetic
!
! 32 and 64 bit reals are normally available.
!
! 32 bit reals 8 bit exponent, 24 bit mantissa
!
! 64 bit reals 11 bit exponent 53 bit mantissa
!
REAL :: R
REAL ( SELECTED_REAL_KIND( 6, 37)) :: R1
REAL ( SELECTED_REAL_KIND(15,307)) :: R2
REAL ( SELECTED_REAL_KIND(15,310)) :: R3

  PRINT *,' '
  PRINT *,' Integer values'
  PRINT *,' Kind    Huge'
  PRINT *,' '
  PRINT *,' ',KIND(I  ),' ',HUGE(I  )
  PRINT *,' '
  PRINT *,' ',KIND(I1 ),' ',HUGE(I1 )
  PRINT *,' ',KIND(I2 ),' ',HUGE(I2 )
  PRINT *,' ',KIND(I3 ),' ',HUGE(I3 )
  PRINT *,' ',KIND(I4 ),' ',HUGE(I4 )
  
  PRINT *,' '
  PRINT *,' Real values'
  PRINT *,' Kind    Huge              ',&
 'Precision       epsilon'
  PRINT *,' '
  PRINT *,' ',KIND(R  ),' ',HUGE(R  ),&
  '           ',PRECISION(R),' ',EPSILON(R)
  PRINT *,' '
  PRINT *,' ',KIND(R1 ),' ',HUGE(R1 ),&
  '           ',PRECISION(R1),' ',EPSILON(R1)
  PRINT *,' ',KIND(R2 ),' ',HUGE(R2 ),&
  ' ',PRECISION(R2),' ',EPSILON(R2)
  PRINT *,' ',KIND(R3 ),' ',HUGE(R3 ),&
  ' ',PRECISION(R3),' ',EPSILON(R3)
END PROGRAM ch0806
