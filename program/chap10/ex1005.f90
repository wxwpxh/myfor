program ex1005
  implicit none
  integer, pointer :: a(:) ! �w�qa�O�@�������а}�C
  allocate( a(5) )  ! �t�m5�Ӿ�ƪ��Ŷ�������a
  a = (/ 1,2,3,4,5 /)
  write(*,*) a
  deallocate( a )   ! allocate�o�쪺�O����n�O�o�k��
  stop
end
