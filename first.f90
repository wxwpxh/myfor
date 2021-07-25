!gfortran first.f90 -o first
!gcc first.f90 -o first  -lgfortran
program first
    print *, "Hello World!"
    print *, sin(123.4)
end program first
