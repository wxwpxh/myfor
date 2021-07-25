! �ֳt�ƧǪk�ܽd
! By Perng 1997/8/30
program QuickSort_Demo
implicit none
  integer, parameter :: N=10
  real :: B(N)
  integer :: A(N)
  
  ! �ζüƨӲ��ͼƦC
  call random_seed()
  call random_number(B)
  A = B*100
  write(*,"('Source=>',10I3)") A

  ! �I�sQuick_Sort�ɰ��F�n�ǤJ�}�C����T�~,�٭n���w�n�ƦC�}�C����
  ! ���W�U����m�d��. �b����M�O�n�� 1,N ,��ܭn�q�Y�ƨ��.
  call Quick_Sort(A,N,1,N)
  write(*,"('Sort=>',10I3)") A

  stop
end program QuickSort_Demo
!
! �ֳt�ƧǪk���Ƶ{��
!
recursive subroutine Quick_Sort(A,N,S,E)
implicit none
  integer :: N    ! ��ܰ}�C���j�p
  integer :: A(N) ! �s��ƾڪ��}�C
  integer :: S    ! �ǤJ���Ѽ�, �o�@�ժ��}�C�_�l��m
  integer :: E    ! �ǤJ���Ѽ�, �o�@�ժ��}�C������m
  integer :: L,R  ! �Ψӧ�A(L)>K��A(R)<K�ɥΪ�
  integer :: K    ! �O�����A(S)
  integer :: temp ! �洫��ӼƭȮɥΪ�
  ! �����n�����wL,R�����. L�n�q�Y�}�l,E�h�n�q���}�l
  L=S  
  R=E+1
  ! Right�� > Left�� �ɤ~�����n�i��Ƨ�  
  if ( R<=L ) return

  K=A(S)  ! �]�w���
  do while(.true.)
    ! ��XA(L)<K���Ҧb
    do while( .true. )
      L=L+1
      if ( (A(L) > K) .or. (L>=E) ) exit
    end do
    ! ��XA(R)>K���Ҧb
    do while( .true. )
      R=R-1
      if ( (A(R) < K) .or. (R<=S) ) exit
    end do
    ! �p�GRight �]�� Left�������, �j��N�ӵ����F
    if ( R <= L ) exit
    ! �洫A(L),A(R)���ƭ�
    temp=A(L)
    A(L)=A(R)
    A(R)=temp
  end do
  ! �洫A(S),A(R)���ƭ�
  temp=A(S)
  A(S)=A(R)
  A(R)=temp
  ! ��R���e���ƾڭ��s����,�A���Ƨ�
  call Quick_Sort(A,N,S,R-1)
  ! ��R���᪺�ƾڭ��s����,�A���Ƨ�
  call Quick_Sort(A,N,R+1,E)
  return
end subroutine Quick_Sort
                
