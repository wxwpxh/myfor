module NUMERICAL
  implicit none
  real, parameter :: zero=0.00001  ! �p��zero���ȷ|�Q��0
contains
! �νu�k�����
  real function newton(a,f,df)
  implicit none
  real :: a	  ! �_�l���q��
  real, external :: f	! �ǤJ���D�Ȩ��
  real, external :: df  ! f'(x)�����
  real :: b	  ! �G��o���
  real :: fb  ! �O��f(a),f(b),f(c)

  b = a-f(a)/df(a)
  fb= f(b)
! �b�X���0 ���e�n�@�����G�񪺤u�@
  do while( abs(fb) > zero )
	a=b
	b=a-f(a)/df(a)
    fb=f(b)
  end do
  newton=b
  return
  end function newton
  ! �D�Ȫ����
  real function func(x)
    implicit none
    real :: x
    func=sin(x)
    return
  end function func
  ! func'(x)
  real function dfunc(x)
    implicit none
    real :: x
    dfunc=cos(x)
    return
  end function dfunc
end module NUMERICAL

program main
  use numerical
  implicit none
  real :: a	  ! �_�l�q��
  real :: ans ! ��
  write(*,*) "��J�_�l�q��"
  read (*,*) a
  ! �ǤJ�_�l�q�ȤΨD�Ȫ����
  ans=newton(a,func,dfunc)
  write(*,"('x=',F8.4)") ans
  stop
end program
