!
! �G���j�M�k�ܽd
! By Perng 1997/8/31
program BINARY_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10      ! �}�C���j�p
  integer :: A(N)=(/2,5,7,9,10,11,13,17,21,23/)
  integer KEY
  integer LOC 
  integer, external :: BINARY_SEARCH

  write(*,"('Source=>',10I3)") A
  write(*,*) 'Input KEY:'
  read (*,*) KEY
  ! �I�s�`�Ƿj�M���Ƶ{��
  LOC=BINARY_SEARCH(A,N,KEY)
  if ( LOC/=0 ) then
    write(*,"('A(',I2,' )='I3)") LOC,KEY
  else
    write(*,*) "Not found"
  end if
  
  stop
end program
!
! �G���j�M�k���Ƶ{��
!
integer function BINARY_SEARCH(A,N,KEY)
  implicit none
  integer N,A(N)
  integer KEY    ! �ҭn�M�䪺��
  integer L      ! �O���C�@�Ӥp�ժ��}�C�_�l��m
  integer R      ! �O���C�@�Ӥp�ժ��}�C������m
  integer M      ! �O���C�@�Ӥp�ժ��}�C������m

  ! �@�}�l���p�սd��N�O��Ӱ}�C
  L=1                     
  R=N
  M=(L+R)/2
  ! �p�GKEY�ȶW�X�d��, �K�w���s�b�}�C��
  if ( (KEY < A(L)) .OR. (KEY > A(R)) ) then
    BINARY_SEARCH = 0
    return
  end if

  do while( L <= R )
    if ( KEY > A(M) ) then
    ! �p�G key > �����ȡA����ƴN���b�W�b��
      L=M+1
      M=(L+R)/2
    else if ( KEY < A(M) ) then
    ! �p�G key < �����ȡA����ƴN���b�U�b��
      R=M-1
      M=(L+R)/2
    else if ( KEY .EQ. A(M) ) then
	  BINARY_SEARCH = M
	  return
    end if
  end do

  BINARY_SEARCH = 0
  return
end function
