program ex0602
implicit none
  integer, parameter :: limit=10  ! �p�ƾ����W��
  integer counter      ! �p�ƾ�
  integer :: ans = 0   ! ���Ӳ֥[�ϥ�

  do counter=2, limit ,2
    ans = ans + counter
  end do
  write(*,*) ans

  stop
end
