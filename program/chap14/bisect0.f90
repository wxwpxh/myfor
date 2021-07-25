!	�G���k�D��
!	By Pon 1997/9/2
module NUMERICAL
  implicit none
  real, parameter :: zero = 0.00001
contains
  real function bisect( A, B )
    implicit none
	real A,B	! �ǤJ���q��
	real C		! �ΨӺ�(A+B)/2
	real FA		! �O��F(A)
	real FB		! �O��F(B)
	real FC		! �O��F(C)

!	���D�XC, F(C)����
	C = (A+B)/2.0	
	FC = func(C)

!   F(C) �p�� ZERO ��,�N�� F(C)=0 , �����j��
	do while( abs(fc) > zero )
	  FA = func(A)
	  FB = func(B)
	  if ( FA*FC < 0 ) then
	  ! f(a)*f(c)<0 ,�Ha,c�Ȭ��s���϶�
		B=C
		C=(A+B)/2.0
	  else
	  ! ���M�N�O�Hb,c���s���϶�
		A=C
		C=(A+B)/2.0
	  end if
      ! �D�X�s��f(c)��
		FC=FUNC(C)
	end do
	bisect = C
	return
	end function
!	�D�ѥΪ����
	real function func(X)
	implicit none
	real X
	FUNC=(X+3)*(X-3)
	return
	end function
end module

program main
  use NUMERICAL
  implicit none
  real  A,B		! ��Ӳq��
  real  ANS		! ��X����
  do while(.true.)
	write(*,*) '��J��Ӳq����'
	read (*,*) A,B
    ! f(a)*f(b) < 0 ���q�Ȥ~�O���Ī��q��
	if ( func(A)*func(B) < 0 ) exit
	write(*,*) "�����T���q��"
  end do
  ! �I�s�G���k�D�ڪ����
  ANS=bisect( A, B )
  ! �g�X���G
  write(*,"('x=',F6.3)") ans
  stop
end

