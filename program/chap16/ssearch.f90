! �`�Ƿj�M�k�ܽd
! By Perng 1997/8/31
program SEQUENTIAL_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! �s��ƾڲժ��}�C
  integer KEY             ! �O���ҭn�䪺��
  integer LOC
  integer, external :: SEQUENTIAL_SEARCH

  write(*,"('Source=>',10I3)") A
  write(*,*) 'Input KEY:'
  read (*,*) KEY                    ! ��J�ݴM���
  ! �I�s�`�Ƿj�M�����
  LOC = SEQUENTIAL_SEARCH(A,N,KEY)
  if ( LOC/=0 ) then
    write(*,"('A(',I2,' )='I3)") LOC,KEY
  else
    write(*,*) "Not found"
  end if
  stop
end program
!
! �`�Ƿj�M�k���Ƶ{��
!
integer function SEQUENTIAL_SEARCH(A,N,KEY)
  implicit none
  integer N, A(N)
  integer KEY             ! �ҭn�M�䪺��
  integer I               ! �j�骺�p�ƾ�

  do I=1,N  ! �}�l������, �̦h��N��.
    if ( KEY==A(I) ) then
      ! ���F, �Ǧ^�Ʀr�b�}�C������m
	  SEQUENTIAL_SEARCH=I
	  return
	end if
  end do
  ! �S���ɶǦ^-1
  SEQUENTIAL_SEARCH=0
  return
end function
