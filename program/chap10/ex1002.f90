program ex1002
  implicit none
  integer, pointer :: p   ! �ŧi�@�ӥi�H���V��ƪ����С@
  allocate(p) ! �t�m�@���i�H�s��integer���O����Ŷ�������p
  p=100       ! �o��O��������p �i�H���@���Ƥ@�˨Өϥ�
  write(*,*) p
  stop
end