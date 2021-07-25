PROGRAM ch0801
IMPLICIT NONE
!
! Example of a Fortran program to calculate net pay
! given an employee's gross pay
!
REAL          :: Gross_wage, Net_wage, Tax
REAL          :: Tax_rate = 0.25
INTEGER       :: Personal_allowance = 4800
CHARACTER*60   :: Their_Name
  PRINT *,'Input employees name'
  READ *,Their_Name
  PRINT *,'Input Gross wage'
  READ *,Gross_wage
  Tax = (Gross_wage - Personal_allowance) * Tax_rate
  Net_wage = Gross_wage - Tax
  PRINT *,'Employee: ',Their_Name
  PRINT *,'Gross Pay: ', Gross_wage
  PRINT *,'Tax: ',Tax
  PRINT *,'Net Pay:',Net_wage
END PROGRAM ch0801


