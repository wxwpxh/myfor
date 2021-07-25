! gfortran -o test1 test1.f95 -llapack -lblas -ltmglib
program main
    implicit none
    INTEGER :: N, LDA, LDB
    INTEGER :: NRHS
    INTEGER :: INFO
    INTEGER :: IPIV(4)
    REAL(8) :: A(4,4), B(4,1)
    
    N=4;LDA=4;LDB=4
    NRHS=1
    
    A=reshape((/1.80,2.88,2.05,-0.89,&
                5.25,-2.95,-0.95,-3.80,&
                1.58,-2.69,-2.90,-1.04,&
                -1.11,-0.66,-0.59,0.80/),(/4,4/))
    B=reshape((/9.52,24.35,0.77,-6.22/),(/4,1/))
  
    call DGESV( N, NRHS, A, LDA, IPIV, B, LDB, INFO )
    
    write(*,*) "Solution:"
    write(*,'(f8.3)') B
    write(*,*) "INFO=", INFO
    
    stop
end program
