module NUMERICAL
  implicit none
  real, parameter :: zero=0.00001  ! �p��zero���ȷ|�Q��0
contains
! �νu�k�����
  real function secant(a,b,f)
  implicit none
  real :: a,b ! �_�l����Ӳq��
  real :: c	  ! �s����
  real, external :: f ! �ǤJ���D�Ѩ��
  real :: fa,fb,fc	! �O��f(a),f(b),f(c)

  fa=f(a)
  fb=f(b)
  c=a-fa*(b-a)/(fb-fa)
  fc=f(c)
! �b�X���0 ���e�n�@�����G�񪺤u�@
  do while( abs(fc) > zero )
	a=b
	b=c
	fa=f(a)
	fb=f(b)
    c=a-fa*(b-a)/(fb-fa)
    fc=f(c)
  end do
  secant=c
  return
  end function secant
  real function func(x)
    implicit none
    real :: x
    func=sin(x)
    return
  end function func
end module numerical

program main
  use NUMERICAL
  implicit none
  real :: a,b	! �_�l�q��
  real :: ans	! ��o����
  write(*,*) "��J��Ӳq��"
  read (*,*) a,b
  ! �ǤJ�_�l�q�ȤΨD�Ȫ����
  ans=secant(a,b,func)
  write(*,"('x=',f8.4)") ans
  stop
end program
