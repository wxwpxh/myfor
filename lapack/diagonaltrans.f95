! gfortran -o diagonaltrans diagonaltrans.f95  -llapack -lblas -ltmglib
program main

    implicit none
    real(8) :: aaa(2,2),ttt(2,2),bbb(2,2)
    character(1) :: job
    integer :: n,lda,ilo,ihi,info,i
    real(8) :: scale(2)
    aaa=reshape(  (/1.d0,3d-6,2d6,4.d0/),         (/2,2/)  )
    job='B'
    n=2
    lda=2
    ttt=0.
    call dgebal( job, n, aaa, lda, ilo, ihi, scale, info )

    forall(i=1:2)
        ttt(i,i)=scale(i)
    end forall
    
    bbb=aaa
    
    print *,bbb
    print *,ttt

end program
