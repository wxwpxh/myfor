
! gfortran -o selectCaseProg selectCaseProg.f95
program selectCaseProg
    implicit none

    ! local variable declaration
    character :: grade = 'B'

    select case (grade)

    case ('A') 
        print*, "Excellent!" 

    case ('B')

    case ('C') 
        print*, "Well done" 

    case ('D')
        print*, "You passed" 

    case ('F')
        print*, "Better try again" 

    case default
        print*, "Invalid grade" 

    end select

    print*, "Your grade is ", grade 

end program selectCaseProg
