program  ex0804
implicit none
  integer :: a = 1
  integer :: b = 2
  call add(a,b)  ! ���ܼ�a��b�浹�Ƶ{��add�ӳB�z
  stop
end

subroutine add(first, second)
implicit none
  integer :: first, second ! first,second�����e�|�qCALL�ɱo��
  write(*,*) first+second
  return
end

