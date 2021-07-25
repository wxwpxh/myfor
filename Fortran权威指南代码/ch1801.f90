PROGRAM ch1801
IMPLICIT NONE
!
! Program to calculate frequency response of a system
! for a given Omega
! and its polar form (magnitude and phase).
!
REAL :: Omega ,Real_part , Imag_part , Magnitude, Phase
COMPLEX:: Frequency_response
! 
! Input frequency Omega 
! 
  PRINT *, 'Input frequency' 
  READ *,Omega 
! 
  Frequency_response = 1.0 / &
    CMPLX( - Omega * Omega + 1.0 , 2.0 * Omega)
  Real_part = REAL(Frequency_response)
  Imag_part = AIMAG(Frequency_response) 
!
! Calculate polar coordinates (magnitude and phase) 
! 
  Magnitude = ABS(Frequency_response)
  Phase = ATAN2 (Imag_part, Real_part)
!
  PRINT *, ' At frequency ',Omega
  PRINT *, 'Response = ', Real_part,' + I ',Imag_part
  PRINT *, 'in Polar form'
  PRINT *, ' Magnitude = ', Magnitude
  PRINT *, ' Phase = ', Phase
END PROGRAM ch1801


