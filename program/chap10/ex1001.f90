program ex1001
  implicit none
  integer, target  :: a=1 ! �ŧi�@�ӥi�H���ؼЪ��ܼ�
  integer, pointer :: p   ! �ŧi�@�ӥi�H���V��ƪ����С@
  p=>a ! �����p�����ܼ�a
  write(*,*) p
  a=2  ! ����a����
  write(*,*) p
  p=3  ! ���ܫ���p���V���O���餺�e
  write(*,*) a
  stop
end