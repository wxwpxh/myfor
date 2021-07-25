program main

    implicit none
    real(8) :: aaa(2,2),det
    integer :: m,n,info,i,ipiv,lda

    aaa=reshape((/1,3,2,4/),(/2,2/))
    m=2
    n=m
    lda=2
    det=1.0d0

    call dgetrf( m, n, aaa, lda, ipiv, info )

    do i=1,m
        det=det*aaa(i,i)
    enddo

    print *,det

end program