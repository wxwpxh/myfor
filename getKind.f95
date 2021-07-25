! gfortran -o getKind getKind.f95
program getKind
implicit none

   integer:: i
   i = selected_real_kind (p = 10, r = 99) 
   print *,'selected_real_kind (p = 10, r = 99)', i
   
end program getKind
