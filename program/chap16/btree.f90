!
! �G����Ƨǥܽd
!
module typedef
  implicit none
  type :: data
    integer :: n       ! �s�񪺸��	
    integer :: repeat  ! ��ƭ��Ъ�����
    type(data), pointer :: left  ! ���K
    type(data), pointer :: right ! �k�K
  end type data
end module typedef

module bin_tree
  use typedef
  implicit none
  private
  type(data), pointer :: tree, action  
  integer, save :: numbers = 0
  public add, TraceTree
contains
!
! �s�[�J�@�����
!
subroutine add( n )
  implicit none
  integer, intent(in) :: n
  integer :: err
  type(data), pointer :: new
  integer :: level
  level=1
  numbers=numbers+1
  write(*, '(1x,a5,i4,a8)' ) "Get :",numbers," numbers"
  ! �t�m�@���s���Ŷ�
  allocate( new, stat=err )
  if ( err/=0 ) then
    write(*,*) "Out of memory!"
    stop
  end if

  write(*,"('root ')", advance="NO")
  ! �]�w���
  new%repeat=1
  new%n=n
  nullify( new%right, new%left )
  ! �p�G�O�Ĥ@�����
  if ( numbers==1 ) then
    action=>new
    tree=>new
    write(*,"(': new')")
    return
  end if
  
  action=>tree

  do while( .true. )
    level=level+1
	! ��Ƥj��ثe�K�F���ƭȮ�
    if ( n>action%n ) then
      if ( associated( action%right ) ) then
        action=>action%right  ! �A�V�k�h�M��ߨ��B
		write(*, "('->R')", advance="NO")
      else
        action%right=>new  ! �إ߷s���k�K 
        action=>new
		write(*, "('->R: new')")
        exit
      end if
    ! ��Ƥp��ثe�K�F���ƭȮ�
    else if ( n<action%n ) then
      if ( associated( action%left ) ) then
        action=>action%left   ! �A�V���h�M��ߨ��B
		write(*, "('->L')", advance="NO")
      else
        action%left=>new  ! �إ߷s�����K
        action=>new
		write(*, "('->L: new')")
        exit
      end if
   ! ��Ƶ���ثe�K�F���ƭȮ�
    else if ( n==action%n ) then
      action%repeat=action%repeat+1  ! �⭫�Ъ��ƥإ[1
      deallocate(new)  ! �i�H���ݭn�o�ӷs���Ŷ�
      write(*, "(': Repeat')")
      return
    end if
  end do
  return
end subroutine add
!
! ��ܱƧǪ����
!
subroutine TraceTree()
  implicit none
  call show_tree( tree )
  return
end subroutine TraceTree
!
! �ƧǸ�ƪ��Ƶ{��
!
recursive subroutine show_tree( show )
  implicit none
  type(data), pointer :: show

  if ( associated( show ) ) then
     call show_tree( show%left )   ! �����X���K�����
     call show_data( show )        ! �A���X�ثe��m�����
     call show_tree( show%right )  ! �̫�~���k�K�����
  end if

  return
end subroutine show_tree
!
! �g�X�o�ӪK�F���x�s�����
!
subroutine show_data( show )
  implicit none
  type(data), pointer :: show
  integer :: i

  do i=1,show%repeat
    write(*,*) show%n
  end do

  return
end subroutine show_data

end module bin_tree
!
! �D�{��
!
program main
  use bin_tree
  implicit none
  integer num
  
  do while(.true.)
    write(*,*) "�п�J���, ��J0�N����"
    read(*,*) num
	if ( num==0 ) exit
    call add(num)
  end do
  call TraceTree()

  stop
end program main
