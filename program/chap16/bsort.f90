! ��w�ƧǪk�ܽd
! By Perng 1997/8/29
program BUBBLE_SORT_DEMO
  implicit none
  integer, parameter :: N=10
  integer :: A(N)=(/6,2,8,4,0,9,3,5,1,7/) ! �ݱƧǪ����
  write(*,"('Source=>',10I3)") A
  call BUBBLE_SORT(A,N)  ! �I�s�ƧǪ��Ƶ{��
  write(*,"('Sort=>',10I3)") A
  stop
end program

subroutine BUBBLE_SORT(A,N)
  implicit none
  integer :: N,A(N)
  integer I,J, TEMP
  do I=N-1,1,-1   ! �}�l��N-1��������
    do J=1,I      ! �@��@�諸�Ӥ���AI���᪺�Ʀr���Τ��
    ! �p�GA(J) > A(J+1) �N��o��Ӽƭȥ洫
      if ( A(J) > A(J+1) ) then
        TEMP=A(J)
        A(J)=A(J+1)
        A(J+1)=TEMP
      end if
    end do
  end do
  return
end subroutine
