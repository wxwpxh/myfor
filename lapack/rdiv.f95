program main

    use lapack95
    implicit none
    real(8) :: aaa(1,2),bbb(1,2),ccc(1,1),aaa1(2,1),bbb1(2,1)
    real(8) :: sss(1)
    integer :: rank,lwork,work(100),info
    lwork=100
    aaa=reshape(  (/1.1,2.1/),         (/1,2/)  )
    bbb=reshape(  (/1,2/),     (/1,2/)  )

    aaa1=transpose(aaa)
    bbb1=transpose(bbb)

    call dgelss( 2, 1, 1, bbb1, 2, aaa1, 2, sss, 0.0d0, rank, work, lwork ,info )

    ccc=aaa1(1,1)

    print *,ccc

end program
