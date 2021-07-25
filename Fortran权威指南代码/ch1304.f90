program ch1304
implicit none
integer , parameter :: n=12
integer :: i
integer , dimension(1:n) :: x
integer , dimension(1:n) :: y
character*9 :: temp
  do i=1,n
    read  100,x(i),temp,y(i)
    100 format(2x,i2,a,i3)
    print 200,x(i),y(i)
    200 format(1x,i3,2x,i3)
  end do
end program ch1304

