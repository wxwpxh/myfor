! ����j�M�k�ܽd
! By Perng 1997/8/31
program HASH_SEARCH_DEMO
  implicit none
  integer, parameter :: N=10 ! �}�C���j�p
  integer Source(N) ! �s��ƾڲժ��}�C
  integer A(100)    ! �s��Hashing �᪺�}�C
  integer KEY       ! �O���ҭn�䪺��
  integer I         ! �j��O�ƾ�
  data Source /21,53,71,19,61,81,3,17,44,93/

  write(*,"('Source=>',10I3)") Source
  write(*,*) 'Input KEY:'
  read (*,*) KEY
  if ( KEY<0 .or. KEY>100 ) then
    write(*,*) "Not found."
	stop
  end if

  ! �إ�Hash��椤, ��椤�񪺬O�ƭȦb�}�C������m
  A = 0
  do I=1,N
    A( Source(I) ) = I
  end do

  ! �bHash��椤�M����
  if ( A(KEY)/=0 ) then
    write(*,"('Source(',I2,' )=',I3)") A(KEY), KEY
  else  
    write(*,*) "Not found"
  end if

  stop
end program
