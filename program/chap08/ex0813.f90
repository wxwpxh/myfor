program ex0813
implicit none
  real a
  common a ! ��B�I��a��b�����ܼƤ�
  a = 1.0
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  integer a
  common a ! ����a��b�����ܼƤ�
  write(*,*) a
  return
end