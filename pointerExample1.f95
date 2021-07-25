! gfortran -o pointerExample1 pointerExample1.f95
program pointerExample
implicit none

   integer, pointer :: p1
   integer, target :: t1 
   
   p1=>t1
   p1 = 1
   
   Print *, p1
   Print *, t1
   
   p1 = p1 + 4
   
   Print *, p1
   Print *, t1
   
   t1 = 8
   
   Print *, p1
   Print *, t1
   
end program pointerExample
