program ex0421
  integer   a
  real      b
  complex   c
  logical   d
  character(len=20) e
  a=10
  b=12.34
  c=(1,2)
  d=.true.
  e="FORTRAN"
  write(*,"(1X,I5)")    a  ! ��I�Ӯ榡�ƾ��
  write(*,"(1X,F5.2)" ) b  ! ��F�Ӯ榡�ƯB�I��
  write(*,"(1X,F4.1,F4.1)" ) c ! complex�]�O�B�I��
  write(*,"(1X,L3)") d  ! ��L�ӿ�Xlogical
  write(*,"(1X,A10)") e ! ��A�ӿ�X�r��
end
