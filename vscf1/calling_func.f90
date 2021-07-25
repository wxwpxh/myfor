! gfortran -o calling_func calling_func.f90
! f95 -o calling_func calling_func.f90

program calling_func
implicit none

   real :: a, b
   a = 2.0
   b = 3.0
   
   Print *, "Before calling swap"
   Print *, "a = ", a
   Print *, "b = ", b
   
   call swap(a, b)
   
   Print *, "After calling swap"
   Print *, "a = ", a
   Print *, "b = ", b
   
end program calling_func


subroutine swap(x, y) 
implicit none

   real :: x, y, temp   
   
   temp = x  
   x = y 
   y = temp  
   
end subroutine swap