module INTEGRAL
  implicit none
  real, parameter :: PI=3.14159
contains
! ���ͼƦC
  subroutine GenerateData(datas, width, func)
    real datas(:), width
	real, external :: func
	real r
	integer i,n
	n = size(datas,1)
	width = PI/(n-1)
	r = 0
	do i=1,n
	  datas(i) = func(r)
	  r = r+width
	end do
  end subroutine
! ��Ϊk�n��
real function Simpson_Integral(datas, width)
  IMPLICIT NONE
  real datas(:), width
  real sum
  integer i,n
  n = size(datas,1)
  if ( mod(n,2)==0 ) then
    write(*,*) "�n���_�Ƶ����"
	stop
  end if
  sum = datas(1) + datas(n) ! ����X�Y�����M
  do i=2,n-1
    if ( mod(i,2)==0 ) then
      sum = sum + 4*datas(i) ! ��4*f(x)�������֥[�_��
	else
      sum = sum + 2*datas(i) ! ��2*f(x)�������֥[�_��
	end if
  end do
  Simpson_Integral = sum * width/3.0        ! SUM�A���WH/3 �N�n�F
  return
end function
end module
! SIMPSON�k�n���ܽd
program main
  use INTEGRAL
  implicit none
  integer, parameter :: N = 9
  real, intrinsic :: sin
  real datas(N), width
  call GenerateData(datas, width, sin)
  write(*,"('ans=',F6.2)") simpson_integral(datas, width)
  stop
end program
