program ex0431
implicit none
  integer :: a=1
  integer :: b=2
  real    :: c
  c=a/b 
! c=1/2=0, ���Mc�O�B�I��,���]��a,b�O���,�p��a/b�ɷ|�ξ�ƥh�p��.
  write(*,"(F5.2)") c 
end
