! ��ܱƧǪk�ܽd
! By Perng 1997/8/29
program SELECTION_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! �ƧǪ����

  write(*,"('Source=>',10I3)") A
  call SELECTION_SORT(A,N)      ! �I�s�ƧǪ��Ƶ{��
  write(*,"('Sort=>',10I3)") A
  
  stop
end program
!
! ��ܱƧǪk���Ƶ{��
!
subroutine SELECTION_SORT(A,N)
  implicit none
  integer :: N,A(N)
  integer I,J  ! �j��p�ƾ�
  integer MIN  ! ��X�C�@�������̤p��
  integer TEMP ! �洫��Ʈɨϥ�

  do I=1,N-1
    MIN=A(I)     ! �ȮɥOA(I)�O�̤p��
    do J=I+1,N
      if ( MIN > A(J) ) then   ! �o�{A(I)���O�̤p
        TEMP=A(J)        ! ��A(I)�BA(J)�洫
        A(J)=A(I)
        A(I)=TEMP
        MIN=A(I)
      end if
	end do
  end do
                              
  return
end subroutine                
        
