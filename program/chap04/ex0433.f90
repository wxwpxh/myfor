program ex0433
implicit none
  integer :: a=1
  real    :: b=2
  real    :: c
  c=a ! ��Ƴ]�w���B�I�ƪ��ʧ@�|�۰��૬
  write(*,"(F5.2)") c
  c=a/b ! �]�����Ƹ�Q���ƫ��A���P, �p�⪺���G�|�H�B�I�ƨӪ��.
  write(*,"(F5.2)") c 
end
