! gfortran -o pointerExample3 pointerExample3.f95
program pointerExample
implicit none

   integer, pointer :: a, b
   integer, target :: t
   integer :: n
   
   t= 1
   a=>t
   t = 2
   b => t
   n = a + b
   
   Print *, a, b, t, n 
   
end program pointerExample
