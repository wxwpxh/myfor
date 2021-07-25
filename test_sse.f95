program test_sse
!use omp_lib
    implicit none
    integer :: i,j,k
    integer,parameter :: N=1000
    real(4) :: v=0.0,ve=0.0
!$omp parallel do schedule(static,2) private(j,k,v) reduction(+:ve)
    do i=1,8
        do j=1,N
            do k=1,N
            v=tan(real(i))*sin(real(j))*cos(real(k))*tan(real(k))*sin(real(i))*cos(real(j))
            ve=ve+v
            enddo
        enddo
    enddo
    !$omp end parallel do
    print *,ve
    !print *,omp_get_num_procs()
end program test_sse
