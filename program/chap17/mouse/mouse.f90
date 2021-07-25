! �B�z�ƹ��ƥ󪺨禡
module MouseEvent
use DFLIB
implicit none
Contains
  ! �ƹ��b�������C���ʤ@��,�N�|�I�s�o�Ө禡
  subroutine ShowLocation(iunit, ievent, ikeystate, ixpos, iypos)
  implicit none
    integer :: iunit		! �ƹ��Ҧb��������unit��
	integer :: ievent		! �ƹ��o�ͪ��T���X
	integer :: ikeystate	! �i�J�o�Ө禡��,�䥦�����䪺���A
	integer :: ixpos,iypos	! �ƹ��b����������m
    type(xycoord) :: t		 
	integer :: result		 
	character(len=15) :: output	! �]�w��X���r��

	result=SetActiveQQ(iunit)		! ��ø�Ϥu�@���V�o�ӵ���
    write(output,100) ixpos,iypos	! ��ƹ��Ҧb��m���T���g�Joutput
100 format("(X:",I4," Y:",I4,")")	!
    result=SetColorRGB(#1010FF)		 
    result=Rectangle($GFILLINTERIOR,0,0,120,18) ! �e�@�ӹ�ߤ��
    result=SetColorRGB(#FFFFFF) 
	call MoveTo( 4,2,t)	
	call OutGText(output)	! �g�X�T��
	! �p�G�ƹ��b���ʷ�, ����P�ɳQ���U, �|���K�e�X�@���I.
	if ( ikeystate==MOUSE$KS_LBUTTON ) then
	  result=SetColorRGB(#0000FF)
	  result=SetPixel(ixpos,iypos)
	end if
	return
  end subroutine
  ! �ƹ��k����U��, �|����o�Ө禡
  subroutine MouseClearScreen(iunit, ievent, ikeystate, ixpos, iypos )
  implicit none
    integer :: iunit		! �ƹ��Ҧb��������unit��
	integer :: ievent		! �ƹ��o�ͪ��T���X
	integer :: ikeystate	! �i�J�o�Ө禡��,�䥦�����䪺���A
	integer :: ixpos,iypos	! �ƹ��b����������m
    type(xycoord) :: t		 
	integer :: result		 

	result=SetActiveQQ(iunit)		! ��ø�ϰʧ@�]�w�b�ƹ��Ҧb�����W
    call ClearScreen($GCLEARSCREEN)	! �M����ӿù�
    
	return
  end subroutine    
end module

program Mouse_Demo
use DFLIB
use MouseEvent
implicit none
  integer :: result
  integer :: event
  integer :: state,x,y

  result=AboutBoxQQ("Mouse Draw Demo\r By Perng 1997/09"C)
  ! �}�ҵ���
  open( unit=10, file='user', title='Mouse Demo', iofocus=.true. )
  ! �ϥΦr�Ϋe, �@�w�n�I�sInitializeFonts
  result=InitializeFonts()
  ! ���Courier New���r�Φb�������ӿ�X			
  result=setfont('t''Courier New''h14w8')
  call ClearScreen($GCLEARSCREEN)	! ���M���@�U�ù�
  ! �]�w�ƹ����ʩΫ��U�����, �|�I�sShowLocation
  event=ior(MOUSE$MOVE,MOUSE$LBUTTONDOWN)
  result=RegisterMouseEvent(10, event, ShowLocation)
  ! �]�w�ƹ��k����U��, �|�I�sMouseClearScreen
  event=MOUSE$RBUTTONDOWN
  result=RegisterMouseEvent(10, event, MouseClearScreen )
  ! ��{����J���ݷƹ���J�����A
  do while(.true.)
    result=WaitOnMouseEvent( MOUSE$MOVE .or. MOUSE$LBUTTONDOWN .or.&
  	MOUSE$RBUTTONDOWN, state, x, y )
  end do
end program
