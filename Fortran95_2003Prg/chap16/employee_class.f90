MODULE employee_class
!
!   This module implements an employee class.  
!
!  Record of revisions:
!      Date       Programmer          Description of change
!      ====       ==========          =====================
!    12/29/06    S. J. Chapman        Original code
!
IMPLICIT NONE

! Type definition
TYPE,PUBLIC :: employee  ! This will be the name we instantiate

   ! Instance variables. 
   !PRIVATE
   CHARACTER(len=30) :: first_name    ! First name
   CHARACTER(len=30) :: last_name     ! Last name
   CHARACTER(len=11) :: ssn           ! Social security number
   REAL :: pay = 0                    ! Monthly pay

CONTAINS

   ! Bound procedures
   PROCEDURE,PUBLIC :: set_employee => set_employee_sub
   PROCEDURE,PUBLIC :: set_name => set_name_sub
   PROCEDURE,PUBLIC :: set_ssn => set_ssn_sub
   PROCEDURE,PUBLIC :: get_first_name => get_first_name_fn
   PROCEDURE,PUBLIC :: get_last_name => get_last_name_fn
   PROCEDURE,PUBLIC :: get_ssn => get_ssn_fn
   PROCEDURE,PUBLIC :: calc_pay => calc_pay_fn
   
END TYPE employee

! Restrict access to the actual procedure names
PRIVATE :: set_employee_sub, set_name_sub, set_ssn_sub
PRIVATE :: get_first_name_fn, get_last_name_fn, get_ssn_fn
PRIVATE :: calc_pay_fn

! Now add methods
CONTAINS

   SUBROUTINE set_employee_sub(this, first, last, ssn)
   ! 
   ! Subroutine to initialize employee data.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object
   CHARACTER(len=*) :: first             ! First name
   CHARACTER(len=*) :: last              ! Last name
   CHARACTER(len=*) :: ssn               ! SSN

   ! Save data in this object.
   this%first_name = first
   this%last_name  = last
   this%ssn        = ssn
   this%pay        = 0
                   
   END SUBROUTINE set_employee_sub


   SUBROUTINE set_name_sub(this, first, last)
   ! 
   ! Subroutine to initialize employee name.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object
   CHARACTER(len=*),INTENT(IN) :: first  ! First name
   CHARACTER(len=*),INTENT(IN) :: last   ! Last name

   ! Save data in this object.
   this%first_name = first
   this%last_name  = last
                   
   END SUBROUTINE set_name_sub


   SUBROUTINE set_ssn_sub(this, ssn)
   ! 
   ! Subroutine to initialize employee SSN.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object
   CHARACTER(len=*),INTENT(IN) :: ssn    ! SSN

   ! Save data in this object.
   this%ssn = ssn
                   
   END SUBROUTINE set_ssn_sub


   CHARACTER(len=30) FUNCTION get_first_name_fn(this)
   ! 
   ! Function to return the first name.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object

   ! Return the first name
   get_first_name_fn = this%first_name
                   
   END FUNCTION get_first_name_fn


   CHARACTER(len=30) FUNCTION get_last_name_fn(this)
   ! 
   ! Function to return the last name.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object

   ! Return the last name
   get_last_name_fn = this%last_name
                   
   END FUNCTION get_last_name_fn


   CHARACTER(len=30) FUNCTION get_ssn_fn(this)
   ! 
   ! Function to return the SSN.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object

   ! Return the last name
   get_ssn_fn = this%ssn
                   
   END FUNCTION get_ssn_fn


   REAL FUNCTION calc_pay_fn(this,hours)
   ! 
   ! Function to calculate the employee pay.  This
   ! function will be overridden by different subclasses.
   !
   IMPLICIT NONE
   
   ! Declare calling arguments
   CLASS(employee) :: this               ! Employee object
   REAL,INTENT(IN) :: hours              ! Hours worked

   ! Return pay
   calc_pay_fn = 0
                   
   END FUNCTION calc_pay_fn

END MODULE employee_class
