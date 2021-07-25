PROGRAM C1006
IMPLICIT NONE
REAL , DIMENSION(-20:20) :: Current 
REAL :: Resistance
INTEGER :: Voltage 
  PRINT *,' Type in the resistance'
  READ *, Resistance
  DO  Voltage = -20,20
    Current(Voltage)=Voltage/Resistance
    PRINT *, Voltage, ' ', Current(Voltage)
  ENDDO
END PROGRAM C1006

