program  ex0826
  implicit none
  interface
    subroutine sub(a,b) ! �w�q�Ƶ{��sub���ϥΤ���
    implicit none
    integer :: a
    integer, optional :: b
    end subroutine sub
  end interface

  call sub(1)   ! �ϥ�1�ӰѼ�
  call sub(2,3) ! �ϥ�2�ӰѼ�
  stop
end program ex0817

subroutine sub(a,b)
  implicit none
  integer :: a
  integer, optional :: b
  write(*,*) present(a)
  if ( present(b) ) then ! ���ǤJb��
    write(*,"('a=',I3,' b=',I3)") a,b ! 
  else                   ! �S���ǤJb��
    write(*,"('a=',I3,' b=unknown')") a
  end if
  return
end subroutine sub
