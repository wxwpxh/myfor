module LinearAlgebra
  implicit none
contains
! Gauss_Jordan法
subroutine Gauss_Jordan(A,S,ANS)
  implicit none
  real    :: A(:,:)
  real    :: S(:)
  real    :: ANS(:)
  real, allocatable :: B(:,:)
  integer :: i, N
  N = size(A,1)  
  allocate(B(N,N))
  ! 保存原先的矩陣A,及陣列S
  B=A 
  ANS=S  
  ! 把B化成對角線矩陣(除了對角線外,都為0)
  call Upper(B,ANS,N) ! 先把B化成上三角矩陣
  call Lower(B,ANS,N) ! 再把B化成下三角矩陣
  ! 求解
  forall(i=1:N)
    ANS(i)=ANS(i)/B(i,i) 
  end forall
  return
end subroutine Gauss_Jordan
! 輸出等式
subroutine output(M,S)
  implicit none
  real    :: M(:,:), S(:)
  integer :: N,i,j
  N = size(M,1)
  ! write中加上advance="no",可以中止斷行發生,使下一次的
  ! write接續在同一行當中.
  do i=1,N
    write(*,"(1x,f5.2,a1)", advance="NO") M(i,1),'A'
    do j=2,N
      if ( M(i,j) < 0 ) then
        write(*,"('-',f5.2,a1)",advance="NO") -M(i,j),char(64+j)
      else
        write(*,"('+',f5.2,a1)",advance="NO") M(i,j),char(64+j)
      end if
    end do
    write(*,"('=',f8.4)") S(i)
  end do
  return
end subroutine output
! 求上三角矩陣的副程式
subroutine Upper(M,S,N)
  implicit none
  integer :: N
  real    :: M(N,N)
  real    :: S(N)
  integer :: I,J,T
  real :: E
  DO T=1,N-1
     DO I=T+1,N
	   E=matrix(T,T)/matrix(T,T)
	   S(I)=S(I)-E*S(T)
	    DO J=T,N
		   matrix(I,J)=matrix(I,J)-E*matrix(T,J)
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
  real    :: S(N)
  integer :: I,J,T,R
  real :: E
  R=N
  do T=N,2,-1
      DO I=T-1,1,-1
	     E=matrix(I,R)/matrix(T,R)
		 S(I)=S(I)-E*S(T)
		 DO J=1,R
		    matrix(I,J)=matrix(I,J)-E*matrix(T,J)
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
  real :: A(N,N)=reshape( (/1,2,3,4,5,6,7,8,8/),(/N,N/) )
  real :: S(N)=(/12,15,17/)
  real :: ans(N)
  integer :: i
  write(*,*) 'Equation:'
  call output(A,S)
  call Gauss_Jordan(A,S,ANS)
  write(*,*) 'Ans:'
  do i=1,N
    write(*,"(1x,a1,'=',F8.4)") char(64+i),ANS(i) 
  end do
  stop
end program
