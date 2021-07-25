! gfortran -o calling_func3 calling_func3.f95
program calling_func
implicit none

   integer :: i, f
   i = 15
   
   Print *, "The value of factorial 15 is"
   f = myfactorial(15)
   Print *, f
   
end program calling_func

! computes the factorial of n (n!)      
recursive function myfactorial (n) result (fac)  
! function result     
implicit none     

   ! dummy arguments     
   integer :: fac     
   integer, intent (in) :: n     
   
   select case (n)         
      case (0:1)         
         fac = 1         
      case default    
         fac = n * myfactorial (n-1)  
   end select 
   
end function myfactorial
