! gfortran -o createComplex createComplex.f95
program createComplex
implicit none

   integer :: i = 10
   real :: x = 5.17
   print *, cmplx(i, x)
   
end program createComplex
