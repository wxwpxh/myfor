! Interactive��ø�ϥܽd
! By Perng 1997/9/20
program Plot_Sine
use DFLIB
implicit none
  logical :: result
  integer :: iresult
  integer :: input		
  type(WindowConfig) :: wc
  real(kind=8), external :: f1,f2,f3	! �ҭnø�����
  ! �}�ҿ�J�Ϊ�����
  open(unit=5,file='user',iofocus=.true.)
  ! -1 �N��ѵ{���ۦ�h���M�w
  wc.numxpixels=300 ! �������e
  wc.numypixels=300 ! ��������
  wc.numtextcols=-1 ! �C��i�e�Ǫ���r
  wc.numtextrows=-1 ! �i�H���X�C��r
  wc.numcolors=-1	! �i�H�ϥΪ��C��
  wc.title="Input Area"C ! ���������D��r
  wc.fontsize=-1	! �ҨϥΪ���r�j�p
  ! �ھ�wc���ҩw�q����ƨӭ��s�]�w�����j�p
  result=SetWindowConfig(wc) 
  result=DisplayCursor($GCURSORON) ! ��{�X���
  ! �}��ø�ϩҭn�ϥΪ�����
  open(unit=10,file='user',iofocus=.true.)
  wc.numxpixels=300 ! �������e
  wc.numypixels=300 ! ��������
  ! -1�N�����{���ۦ�h���M�w
  wc.numtextcols=-1	! �C��e�q����r
  wc.numtextrows=-1	! �i�H���X�C��r
  wc.numcolors=-1	! �ϥΦh���C��
  wc.title="Plot Area"C ! ���������D
  wc.fontsize=-1
  ! �ھ�wc���ҩw�q����ƨӭ��s�]�w�����j�p
  result=SetWindowConfig(wc)
  ! �{���ۧګ��U��椤Windows��Tile���O, �Ϩ�ӵ�������
  ! ���|���ۭ��|
  result=ClickMenuQQ(QWIN$TILE) 
  input=1 ! �H�K���@�ӦX�z����, ���M����i�J�U�����j��
  ! ���J�ϥΪ������]���i�H�Q��J�����A, 5�N�O�Ĥ@���}��
  ! user�ɩҥΪ�unit��
  result=FocusQQ(5) 
  do while( input>0 .and. input<4 )
    write(5,*) '(1) Plot f(x)=sin(x)'
	write(5,*) '(2) Plot f(x)=cos(x)'
	write(5,*) '(3) Plot f(x)=(x+2)*(x-2)'
	write(5,*) 'Other to EXIT'
	read(5,*) input
	result=SetActiveQQ(10) ! ��ø�ϫ��O���w��ø�ϵ������N�X�W
	! �ھ�input�ӨM�w�n�e�X���@�Ө��
	select case(input)
	case (1)
	  call Draw_Func(f1)
	case (2)
	  call Draw_Func(f2)
	case (3)
	  call Draw_Func(f3)
	end select
  end do
  ! �]�w�D�{���X������,�����|�۰�����
  result=SetExitQQ(QWIN$EXITNOPERSIST)
end program Plot_Sine

subroutine Draw_Func(func)
use DFLIB
implicit none
  integer, parameter :: lines=500	! �Φh�ֽu�q�ӵe��Ʀ��u
  real(kind=8), parameter :: X_Start=-5.0	! x�b�̤p�d��
  real(kind=8), parameter :: X_End=5.0		! x�b�̤j�d��	
  real(kind=8), parameter :: Y_Top=5.0		! y�b�̤j�d�� 
  real(kind=8), parameter :: Y_Bottom=-5.0	! y�b�̤p�d��
  integer :: result			! ���^ø�Ϩ�ƹB�@���A
  integer(kind=2) :: color	! �]�w�C���
  real(kind=8) :: step		! �j�骺�W�q
  real(kind=8) :: x,y		! ø�Ϯɨϥ�,�C���p�u�q���s��
  real(kind=8) :: NewX,NewY	! (x,y)��(NewX,NewY)
  real(kind=8), external :: func ! ��ø�Ϫ����
  type(wxycoord) :: wt		! �Ǧ^�W�@�����޿�y�Ц�m
  type(xycoord)  :: t		! �Ǧ^�W�@������ڮy�Ц�m
  type(rccoord)	 :: rt

  call ClearScreen($GCLEARSCREEN) ! �M���ù�
  ! �]�w�޿�y�нd��j�p	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! �ί��ޭȪ���k�ӳ]�w�C��
 
  ! �ϥΥ��mRGB 0-255��256�ئⶥ�ӳ]�w�C��
  color=RGBToInteger(255,0,0)		! �ⱱ��RGB���T�ӭȿ@�Y��color��
  result=SetColorRGB(color)			! �Q��color�ӳ]�w�C��

  call MoveTo_W(X_Start,0.0_8,wt)	! �eX�b
  result=LineTo_W(X_End,0.0_8)		! 
  call MoveTo_W(0.0_8,Y_Top,wt)		! �eY�b
  result=LineTo_W(0.0_8,Y_Bottom)	! 	
  step=(X_End-X_Start)/lines		! �p��p�u�q����X���Z
  ! �Ѽ�#FF0000�O�ϥ�16�i�쪺��k�Ӫ�ܤ@�Ӿ��
  result=SetColorRGB(#FF0000)		 
  ! �}�lø�s�p�u�q��
  do x=X_Start,X_End-step,step
    y=func(x)		! �u�q�������I
	NewX=x+step		
	NewY=func(NewX)	! �u�q���k���I
	call MoveTo_W(x,y,wt)
	result=LineTo_W(NewX,NewY)
  end do

  call SETTEXTPOSITION (int2(3),int2(5),rt) ! ����textposition�������(5,5)
  call OUTTEXT("hello")
  ! �]�w�{��������,�����|�~��O�d
  result=SetExitQQ(QWIN$EXITPERSIST)
end subroutine Draw_Func
! �ҭnø�Ϫ����
real(kind=8) function f1(x)
implicit none
  real(kind=8) :: x
  f1=sin(x)
  return
end function f1
real(kind=8) function f2(x)
implicit none
  real(kind=8) :: x
  f2=cos(x)
  return
end function f2
real(kind=8) function f3(x)
implicit none
  real(kind=8) :: x
  f3=(x+2)*(x-2)
  return
end function f3