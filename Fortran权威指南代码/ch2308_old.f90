program ch2308

implicit none
integer :: n
real , allocatable , dimension(:) :: x
real :: m,sd,median
integer , dimension(8) :: timing

interface
  subroutine stats(x,n,mean,std_dev,median)
    implicit none
    integer , intent(in)                  :: n
    real    , intent(in) , dimension(:)   :: x
    real    , intent(out)                 :: mean
    real    , intent(out)                 :: std_dev
    real    , intent(out)                 :: median
  end subroutine stats
end interface

  n=1000
  do
    print *,' n = ',n
    allocate(x(1:n))
    call random_number(x)
    x=x*1000
    call date_and_time(values=timing)
    print *,' initial '
    print *, timing(6) , timing(7) , timing(8)
    call stats(x,n,m,sd,median)
    print *,' mean = ',m
    print *,' Standard deviation = ',sd
    print *,' median is = ',median
    call date_and_time(values=timing)
    print *,' after'
    print *,timing(6),timing(7),timing(8)
    n=n*10
    deallocate(x)
  end do

end program ch2308


