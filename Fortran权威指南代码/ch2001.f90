PROGRAM ch2001
IMPLICIT NONE
TYPE Date
  INTEGER :: Day=1
  INTEGER :: Month=1
  INTEGER :: Year=2000
END TYPE Date
TYPE (Date) :: D
  PRINT *,D%Day, D%Month, D%Year
  PRINT *,' Type in the date, day, month, year'
  READ *,D%Day, D%Month, D%Year
  PRINT *,D%Day, D%Month, D%Year
END PROGRAM ch2001

