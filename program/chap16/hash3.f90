module NumLink                          
  implicit none
  integer, parameter :: N=10    
  ! �ŧi�s�@��C�����A
  type :: link
    integer :: num                      ! �x�s�ƾڲ�
    type(link), pointer :: next         ! ���V�U�@������������
  end type link

  type(link), target  :: linking(N) ! �x�shashing�᪺���
  type(link), pointer :: proc      ! �ȮɨϥΪ�����

  integer :: Source(N) = (/ 21,53,71,19,61,81,3,17,44,93 /)

contains
  subroutine InitLink()
    integer i
	do i=1,N
	  linking(i)%num = 0
	  nullify(linking(i)%next)
	end do
  end subroutine

! hash���
  integer function hash(KEY)
    integer KEY
    hash = KEY/10+1
	return
  end function
!
! ��Ʀr�g�L����B�z���J��C���Ƶ{��
!
  subroutine Insert(KEY, INFO)
    integer :: KEY, INFO ! �ҭn���J���Ʀr�ΦbSource������m
    integer :: L         ! hashing �᪺���G

    L=hash(KEY)        
    proc=>linking(L) ! ��proc���V�}�Clinking��hash(L)����m

    ! ���ʨ��C�����̫�@�Ӧ�m
    do while( proc%num /= 0 )
      proc=>proc%next
    end do

    proc%num = INFO
    !�t�m�O����Ŷ���proc%next
    allocate(proc%next)
	proc=>proc%next
    proc%num = 0
	nullify(proc%next)
  end subroutine Insert 
!
! �b��C���j�M��ƪ��Ƶ{��
!
  subroutine Hash_Search( KEY )
    integer :: KEY  ! �n�j�M����
    integer :: L    ! �p��hashing�᪺��

    L=hash(KEY)
    proc=>linking(L)        ! ��proc���V�}�Clinking��hash(L)����m

    ! �b�o�@�Ӧ�C���@���V�U�`�Ƿj�M���쬰��
    do while( .true. )
	  if ( proc%num==0 ) then
	    write(*,*) "Not found."
		return
	  end if
	  if ( Source(proc%num)==KEY ) then
	    write(*,"('Source(',I2,' )=',I3)") proc%num, KEY
		return
	  end if
	  if ( associated(proc%next) ) proc=>proc%next
    end do
    return
  end subroutine Hash_Search
!
! ��X��C����ƪ��Ƶ{��
!
  subroutine OutputLink()
    integer :: i 
    do i=1,N
      proc=>linking(i)
      write(*,"(1X,I2,':')", advance="NO") i
      do while( associated(proc%next) )
        write(*,"('->',I2)", advance="NO" ) Source(proc%num)
        proc=>proc%next
      end do
      write(*,*)
    end do
  end subroutine OutputLink

end module NumLink
!       
!    ����j�M�k�ܽd
!                  
program HASHING_SEARCH_DEMO
use NumLink
implicit none
  integer :: KEY  ! �O���ҭn�䪺��
  integer :: I    ! �j��O�ƾ�

  call InitLink()
  write(*,"('Source=>',10I3)") Source
  do I=1,N
    call Insert( Source(I), I )
  end do
  write(*,*) 'Link List=>'
  call OutputLink()
! Ū�J�n�䪺��
  write(*,*) 'Input KEY:'
  read (*,*) KEY
! �I�s�`�Ƿj�M���Ƶ{��
  call Hash_Search(KEY)
  stop
end program HASHING_SEARCH_DEMO
