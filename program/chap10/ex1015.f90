module linklist
  implicit none
  type :: datalink
    integer :: i
    type(datalink), pointer :: prev ! ���V�W�@�����
    type(datalink), pointer :: next ! ���V�U�@�����
  end type datalink

contains

subroutine outputlist( list )
  implicit none
  type(datalink), pointer :: list, p
  p=>list
  do while( associated(p) )
    write(*,*) p%i
    p=>p%next
  end do
  return   
end subroutine
! ����Щҫ��쪺��C��m����
subroutine delitem( item )
  implicit none
  type(datalink), pointer :: item
  type(datalink), pointer :: prev, next

  prev=>item%prev  ! �O���Uitem�W�@����ƪ���m
  next=>item%next  ! �O���Uitem�U�@����ƪ���m
  deallocate(item) ! ����item�Ҧ��ΰO����
  ! ���s�]�wprev%next, �쥻prev%next=>item, ���Litem�w�g�R���F
  if ( associated(prev) ) prev%next=>next
  ! ���s�]�wnext%prev, �쥻next%prev=>item, ���Litem�w�g�R���F
  if ( associated(next) ) next%prev=>prev ! 
  item=>next

  return
end subroutine
! �bpos���Щҫ��쪺��C��m�����Jitem
! after=.true.��, item���bpos����
! after=.false.��, item���bpos���e
subroutine insitem( pos, item, after )
  implicit none
  type(datalink), pointer :: pos, item
  logical :: after
  if ( after ) then
  ! item���bpos���᭱
    item%next=>pos%next
	item%prev=>pos
	if ( associated(pos%next) ) then
      pos%next%prev=>item
    end if
    pos%next=>item
  else
  ! item���bpos���e��
    item%next=>pos
	item%prev=>pos%prev
	if ( associated(pos%prev) ) then
	  pos%prev%next=>item
	end if
    pos%prev=>item
  end if
  return
end subroutine

end module

program ex1015
  use linklist
  implicit none
  type(datalink), pointer :: head
  type(datalink), pointer :: item, p
  integer, parameter :: s=5
  integer :: i,n,error
  
  allocate(head)
  head = datalink(1, null(), null() )
  ! �إߦ�C
  p=>head
  do i=2,s
    allocate( p%next, stat=error )
	if ( error/=0 ) then
	  write(*,*) "Out of memory!"
	  stop
	end if
	p%next=datalink(i, p, null())
	p=>p%next
  end do
  
  write(*,*) "������3�����"
  call delitem(head%next%next)
  call outputlist(head)

  write(*,*) "���J�s����3�����"
  allocate(item)
  item%i=30
  call insitem(head%next,item,.true.)
  call outputlist(head)

stop
end program

