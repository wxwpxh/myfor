program ex0823
  implicit none
  integer :: a=4
  integer b
  call div(a,b)
  write(*,*) a,b
  stop
end program

subroutine div(a,b)
  implicit none
  integer, intent(in) :: a  ! ���wa�O��Ū
  integer, intent(out) :: b ! ���wb�b�Ƶ{�������ӭn���]�ƭ�
  integer c
  c=b
  b=a/2
end subroutine

