program ex0821
  implicit none
  real, external  :: func ! �ŧifunc�O�Ӧۭq���
  real, intrinsic :: sin  ! �ŧisin�O�w�s���

  call ExecFunc(func)
  call ExecFunc(sin)

  stop
end program

subroutine ExecFunc(f)
  implicit none
  real, external :: f ! �ŧi�Ѽ�f�O�Ө��
  write(*,*) f(1.0)   ! ����ǤJ�����f
  return
end 

real function func(num)
  implicit none
  real :: num
  func = num*2
  return
end function