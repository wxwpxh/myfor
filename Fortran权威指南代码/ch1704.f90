PROGRAM ch1704
IMPLICIT NONE
CHARACTER (80) :: Line
INTEGER :: I
  DO
    READ '(A)', Line
    I=INDEX(Line,'Geology')
    IF (I /= 0) THEN
      PRINT *, ' String Geology found at position ',I
      PRINT *, ' in line ', Line
      EXIT
    ENDIF
  ENDDO
END PROGRAM ch1704

