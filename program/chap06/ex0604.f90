program ex0604
implicit none
  integer, parameter :: limit=10  ! �p�ƾ����W��
  integer counter      ! �p�ƾ�
  integer :: ans = 0   ! ���Ӳ֥[�ϥ�

  counter = 2  ! �]�w�p�ƾ����
  do while( counter <= limit )
    ans = ans + counter
    counter = counter + 2  ! �p�ƾ��֥[
  end do

  write(*,*) ans

  stop
end
