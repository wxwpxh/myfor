module LinearAlgebra
  implicit none
contains
! ��X�x�}���Ƶ{��
subroutine output(matrix)
  implicit none
  integer :: m,n
  real    :: matrix(:,:)
  integer :: i
  character(len=20) :: for='(??(1x,f6.3))'
  m = size(matrix,1)
  n = size(matrix,2)
  ! �Φr��ӳ]�w��X�榡
  write( FOR(2:3), '(I2)' ) n
  do i=1,m
	write( *, FMT=FOR ) matrix(i,:)
  end do
  return
end subroutine output
! �D�W�T���x�}���Ƶ{��
subroutine Upper(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: M,N
  integer :: I,J
  integer::T
  real :: E
  M=size(matrix,1)
  N=size(matrix,2)
  do T=1,M-1
	do I=T+1,M
	   E=matrix(I,T)/matrix(T,T)
	    do J=T,N
		  matrix(I,J)=matrix(I,J)-E*matrix(T,J)
        END DO
   END DO		  
  END DO			    
  return
end subroutine Upper
! �D�U�T���x�}���Ƶ{��
subroutine Lower(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: M,N
  real :: I,J,E
  M = size(matrix,1)
  N = size(matrix,2)
  do I=N,2,-1
    do J=I-1,1,-1           
      E=matrix(J,I)/matrix(I,I)
	  ! ��90���\��i�H�֤@�h�j��
      matrix(J,1:I)=matrix(J,1:I)-matrix(I,1:I)*E 
    end do
  end do
  return
end subroutine Lower
end module

program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N = 3	! Size of Matrix
  real :: A(N,N) = reshape( (/1,2,1,3,2,3,2,3,4/),(/N,N/) )
  real :: B(N,N)

  write(*,*) "Matrix A:"
  call output(A)
  B=A
  write(*,*) "Upper:"
  call Upper(B)
  call output(B)
  B=A
  write(*,*) "Lower:"
  call Lower(B)
  call output(B)
  stop
end program
