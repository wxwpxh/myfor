! gfortran -o calling_func2 calling_func2.f95
program calling_func
implicit none

   real :: x, y, z, disc
   
   x= 1.0
   y = 5.0
   z = 2.0
   
   call intent_example(x, y, z, disc)
   
   Print *, "The value of the discriminant is"
   Print *, disc
   
end program calling_func


subroutine intent_example (a, b, c, d)     
implicit none     

   ! dummy arguments      
   real, intent (in) :: a     
   real, intent (in) :: b      
   real, intent (in) :: c    
   real, intent (out) :: d   
   
   d = b * b - 4.0 * a * c 
   
end subroutine intent_example
