program ex0841
  implicit none
  include 'ex0841.inc'  ! ���Jex0841.inc�����e
  a=1
  b=2
  call sub()
  stop
end 

subroutine sub()
  implicit none
  include 'ex0841.inc'  ! ���Jex0841.inc�����e
  write(*,*) a,b
  return
end
