program main

    implicit none
    real(8) :: aaa(2,2),uuu(2,2)
    character :: uplo
    integer :: n,lda,info,i,j

    aaa=reshape((/5,3,3,8/),(/2,2/))
    uplo='U'
    n=2
    lda=2
    uuu=0.

    call dpotrf( uplo, n, aaa, lda, info )

    forall(i=1:n,j=1:n,i<=j)
        uuu(i,j)=aaa(i,j)
    end forall

    print *,uuu

end program
