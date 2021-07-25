! gfortran -o pointerExample pointerExample.f95
program pointerExample
implicit none

   integer, pointer :: p1
   allocate(p1)
   
   p1 = 1
   Print *, p1
   
   p1 = p1 + 4
   Print *, p1
   
end program pointerExample
