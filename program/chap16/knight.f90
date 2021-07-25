module STACK_UTILITY
  implicit none
  private
  integer, parameter :: TOP=50
  integer, save :: current = 0
  integer, save :: stack(TOP)
  public push, pop
contains
  ! ���Ʃ�J���|��  
  subroutine push(value)
    integer value
	if ( current>TOP ) then ! �W�L�e�q
	  write(*,*) "Stack full."
	  return
	end if
	current = current+1
	stack(current)=value
  end subroutine
  ! �q���|�����X���
  integer function pop(value)
    integer value
    if ( current<=0 ) then ! �w�g�S���F��i�H���F
	  pop=1
	  return
	end if
	value = stack(current)
	current = current-1
	pop = 0
  end function

end module
!
! �M�h���ѽL���ܽd
! By Perng 1997/9/1
program knight
  use STACK_UTILITY
  implicit none
  integer, parameter :: n=5 ! �w�q�ѽL���h�j
  integer board(n,n)      ! �O���ѽL�����A
  integer, parameter :: total = n*n ! �ѽL���X�Ӯ�l�n��
  integer x_move(8)       ! �M�h��8 �ز��ʪ��B�k
  integer y_move(8)       !
  integer x_pos,y_pos     ! �M�h�ثe�b�ѽL�W����m
  integer x_new,y_new     ! �Ȯɺ�X���U�@���}�B
  integer move            ! �ҭn�ϥΪ��B�k
  integer step            ! �����F�h�֨B
  integer sol             ! �p���`�@���X�ب��k�i�H����
  integer error
  data x_move /1,2, 2, 1,-1,-2,-2,-1/
  data y_move /2,1,-1,-2,-2,-1, 1, 2/
  data board / total*0 /  ! ���]��0 ,�N���٨S���L
  data sol /0/            ! �Ѫ��ƥإ��]��0
        
! ���]�q�ѽL���������}�l��
  x_pos=(n+1)/2           
  y_pos=(n+1)/2           
  step=1
  board(x_pos,y_pos)=step ! �Ĥ@�B�b��

  move=1        ! ���ղĤ@�ب��k
  do while(.true.)
    do while( move <= 8 )     ! �]���u��8�ب��k
      ! ��X�U�@�B
      x_new=x_pos+x_move(move)
      y_new=y_pos+y_move(move)
      ! ����W�X�ѽL
      if ( x_new < 1  .or.  x_new > n ) then
        move=move+1
        cycle
      end if
      if ( y_new < 1  .or.  y_new > n ) then
        move=move+1
        cycle
      end if
      ! ��o�ӤU�@�B����m�O�Ŧ��, �~�i���M�h�i�J
      if ( board(x_new,y_new) == 0 ) then
        x_pos=x_new
        y_pos=y_new
        step=step+1 
        board(x_pos,y_pos)=step ! ���\����X�U�@�B
        call push(move)   ! ��ثe���B�k�e�J���|
        move=1            ! �U�@�B�A�q�Ĥ@�بB�k�}�l��
      else
        move=move+1             ! �a�I���w�ӹL, ���ӷs���B�k
      end if
    end do
    ! setp=total=n*n �ɥN���������M�F
    if ( step == total ) then
      sol=sol+1
      write(*,"('��',I3,'�Ӹ�')") sol
      call show_board(board,n)
    end if
    ! ���^�h�@�B�A�V�U��
    step=step-1
    ! step<=0 �N��L���i�h�F, ���X�j��
    if ( step <= 0 ) exit 
    board(x_pos,y_pos)=0  ! �V�^�h, �ҥH�o�Ӧa��n�]���S�ӹL
    error = pop(move)      ! �q���|�����X�W�@�ӨB�k
	if ( error/=0 ) then
	  write(*,*) "Stack empry"
	  stop
	end if
    ! �V�^�h�@�B
    x_pos=x_pos-x_move(move)
    y_pos=y_pos-y_move(move)
    ! ���@�ӷs���B�k�Ӹո�
    move=move+1
  end do
  write(*,"('�s�@��',I3,'�ظѪk')") sol
  stop
end program
!
! ��ܴѽL���A���Ƶ{��
!
subroutine show_board(board,n)
  implicit none
  integer n
  integer board(n,n)
  integer i,j
  character*(20) :: for = '(??(1x,i3))'
! �Φr��ӳ]�w��X�榡
  write( for(2:3), '(i2)' ) n
  do i=n,1,-1
    write( *, fmt=for ) board(:,i)
  end do
  return
end
