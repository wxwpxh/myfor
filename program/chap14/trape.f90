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
  real function Trape_Integral(datas, width)
    implicit none
    real datas(:)
    real width     ! �C����ƪ����j
    real SUM       ! �p��Ҧ��W���[�U�����H�G���M
    integer i,n
    n = size(datas,1)
    SUM = (datas(1)+datas(n))/2.0
    do i=2,n-1
      SUM=SUM+datas(i) ! �֥[���
    end do
    Trape_Integral=SUM*width  ! �p�⭱�n�M
    return
  end function 
end module
! ��Ϊk�n���ܽd
program main
  use INTEGRAL
  implicit none
  integer, parameter :: N = 10
  real DATAS(N), width
  real ANS  ! ����  
  real, intrinsic :: sin ! �����ΨӲ��͸�ƪ����
  call GenerateData(DATAS, width, sin)
  ANS = Trape_Integral(DATAS, width)  ! �p��n��
  write(*,"('ans=',F5.2)") ANS        ! �g�X����
  stop
end program