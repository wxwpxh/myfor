! ��ܱƧǪk�ܽd
! By Perng 1997/8/29
program SHELL_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! �ƧǪ����

  write(*,"('Source=>',10I3)") A
  call SHELL_SORT(A,N)
  write(*,"('Sort=>',10I3)") A

  stop
end program
!
! ��ܱƧǪk���Ƶ{��
!
subroutine SHELL_SORT(A,N)
  implicit none
  integer :: N,A(N) ! �ǤJ�����
  integer I,J       ! �j��p�ƾ�
  integer TEMP      ! �洫�ƭȥ�
  integer K         ! K ��

  K=N/2             ! K �����

  do while( K>0 )
    do I=K+1,N
      J=I-K
      do while( J>0 )
      ! �p�GA(J)>A(J+K),�n�洫���̪��ƭ�,�é��^���X
      ! A(J-K)�BA(J)���s���@�ըӤ���C
        if ( A(J) .GT. A(J+K) ) then
          TEMP=A(J)
          A(J)=A(J+K)
          A(J+K)=TEMP
          J=J-K
        else
          exit ! A(J)<A(J+K)�ɥi���X�j��
        end if
	  end do
	end do
    K=K/2 ! �]�w�s��K��
  end do

  return
end subroutine
                
        
