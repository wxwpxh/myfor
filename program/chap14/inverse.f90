module LinearAlgebra
  implicit none
contains
! 求反矩陣
subroutine inverse(A,IA)
  implicit none
  real    :: A(:,:), IA(:,:)
  real, allocatable :: B(:,:)
  integer :: i,j,N
  N = size(A,1)  
  allocate(B(N,N))
  ! 先把IA設定成單位矩陣
  forall(i=1:N,j=1:N,i==j) IA(i,j)=1.0
  forall(i=1:N,j=1:N,i/=j) IA(i,j)=0.0
  ! 保存原先的矩陣A, 使用B來計算
  B=A 
  ! 把B化成對角線矩陣(除了對角線外,都為0)
  call Upper(B,IA,N) ! 先把B化成上三角矩陣
  call Lower(B,IA,N) ! 再把B化成下三角矩陣
  ! 求解
  forall(i=1:N) IA(i,:)=IA(i,:)/B(i,i) 
  return
end subroutine
! 輸出矩陣的副程式
subroutine output(matrix)
  implicit none
  real    :: matrix(:,:)
  integer :: m,n,i
  character(len=20) :: for='(??(1x,f6.3))'
  m = size(matrix,1)
  n = size(matrix,2)
  ! 用字串來設定輸出格式
  write( FOR(2:3), '(I2)' ) N
  do i=1,N
	write( *, FMT=FOR ) matrix(i,:)
  end do
  return
end subroutine output
! 求上三角矩陣的副程式
subroutine Upper(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N,N)
  integer :: I,J,T
  real :: E
  DO T=1,N-1
     DO I=T+1,N
	    E=M(I,T)/M(T,T)
		DO J=T,N
		   M(I,J)=M(I,J)-E*M(T,J)
		   S(I,J)=S(I,J)-E*S(T,J)
        END DO
	END DO
  END DO		 
  return
end subroutine Upper
! 求下三角矩陣的副程式
subroutine Lower(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N,N)
  integer :: I,J,T,R
  real :: E
  R=N
  DO T=N,2,-1
     DO I=T-1,1,-1
	    E=M(I,R)/M(T,R)
		DO J=1,R
		   M(I,J)=M(I,J)-E*M(T,J)
		   S(I,J)=S(I,J)-E*S(T,J)
		END DO
     END DO
	 R=R-1
  END DO
  return
end subroutine Lower
end module
! 求解聯立式
program main
  use LinearAlgebra
  implicit none
  integer, parameter :: N=3 ! Size of Matrix
  real :: A(N,N) = (/ 1,2,3,4,5,6,7,8,8 /)
  real :: IA(N,N)
  integer :: i
  write(*,*) "原矩陣"
  call output(A)
  call inverse(A,IA)
  write(*,*) "反矩陣"
  call output(IA)
  stop
end program
