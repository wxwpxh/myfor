!  gfortran -o arithmeticOp arithmeticOp.f95

program arithmeticOp
    ! this program performs arithmetic calculation
    implicit none  
    ! variable declaration
    integer :: a, b, c

    ! assigning values 
    a = 5   
    b = 3  
    ! Exponentiation 
    c = a ** b 
    print *, "c = ", c

    ! Multiplication  
    c = a * b 
    print *, "c = ", c

    ! Division  
    c = a / b 
    print *, "c = ", c

    ! Addition
    c = a + b 
    print *, "c = ", c

    ! Subtraction 
    c = a - b 
    print *, "c = ", c

end program arithmeticOp
