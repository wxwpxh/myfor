! gfortran -o printName printName.f90
program printName
implicit none

   character (len=15) :: first_name
   print *,' Enter your first name.' 
   print *,' Up to 20 characters, please'
   
   read *,first_name 
   print "(1x,a)",first_name
   
end program printName
