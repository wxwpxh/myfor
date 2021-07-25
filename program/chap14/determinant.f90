module LinearAlgebra
  implicit none
contains
! 求矩陣的Determinant值
real function Determinant(matrix)
  real    :: matrix(:,:)
  real, allocatable :: ma(:,:)
  integer :: i,N
  N = size(matrix,1)
  allocate(ma(N,N))
  ma = matrix
  call Upper(ma)  
  Determinant = 1.0
  do i=1,N
    Determinant = Determinant*ma(i,i)
  end do
end function
! 求上三角矩陣的副程式
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
end module

program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N = 3	! Size of Matrix
  real :: A(N,N) = reshape( (/1,2,1,3,2,3,2,3,4/),(/N,N/) )
  write(*,"('det(A)=',F6.2)") Determinant(A)
  stop
end program
