! �ϥο��ܽd
! By Perng 1997/9/22
program Menu_Demo
use DFLIB
implicit none
  type(windowconfig) :: wc
  integer :: result  
  integer :: i,ix,iy
  wc.numxpixels=200 ! �������e
  wc.numypixels=200 ! ��������
  ! -1�N�����{���ۦ�h���M�w
  wc.numtextcols=-1	! �C��e�q����r
  wc.numtextrows=-1	! �i�H���X�C��r
  wc.numcolors=-1	! �ϥΦh���C��
  wc.title="Plot Area"C ! ���������D
  wc.fontsize=-1
  ! �ھ�wc���ҩw�q����ƨӭ��s�]�w�����j�p
  result=SetWindowConfig(wc)
  ! ��{����J���ݷƹ��T�������A
  do while (.TRUE.)
    i = waitonmouseevent(MOUSE$RBUTTONDOWN, i, ix, iy)
  end do
end program
!
! �{���|�۰ʰ���o�Ө��, ���|�]�w����������
!
logical(kind=4) function InitialSettings()
use DFLIB
implicit none
  logical(kind=4) :: result
  type(qwinfo) :: qw
  external PlotSin,PlotCos  
  
  ! �]�w��ӵ����{���@�}�l�X�{����m�Τj�p
  qw.type=QWIN$SET
  qw.x=0
  qw.y=0
  qw.h=400
  qw.w=400
  result=SetWSizeQQ(QWIN$FRAMEWINDOW,qw) 
  ! ��´�Ĥ@�տ��
  result=AppendMenuQQ(1,$MENUENABLED,'&File'C,NUL)		 
  result=AppendMenuQQ(1,$MENUENABLED,'&Save'C,WINSAVE)   
  result=AppendMenuQQ(1,$MENUENABLED,'&Print'C,WINPRINT) 
  result=AppendMenuQQ(1,$MENUENABLED,'&Exit'C,WINEXIT)  
  ! ��´�ĤG�տ��
  result=AppendMenuQQ(2,$MENUENABLED,'&Plot'C,NUL)
  result=AppendMenuQQ(2,$MENUENABLED,'&sin(x)'C,PlotSin)
  result=AppendMenuQQ(2,$MENUENABLED,'&cos(x)'C,PlotCos)
  ! ��´�ĤT�տ��
  result=AppendMenuQQ(3,$MENUENABLED,'&Exit'C,WINEXIT)

  InitialSettings=.true.
  return
end function InitialSettings
!
! �esin���Ƶ{��
!
subroutine PlotSin(check)
use DFLIB
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f1
  integer :: result
  ! �b�ĤG�տ�檺�Ĥ@�ӿﶵ,�]�N�Osin���e�����Ӥ�
  result=ModifyMenuFlagsQQ(2,1,$MENUCHECKED)
  ! ��ﶵcos�e���Ĩ���
  result=ModifyMenuFlagsQQ(2,2,$MENUUNCHECKED)
  call Draw_Func(f1)
  return
end subroutine
!
! �ecos���Ƶ{��
!
subroutine PlotCos(check)
use DFLIB
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f2
  integer :: result
  check=.true.
  ! ��ﶵsin�e���Ĩ���
  result=ModifyMenuFlagsQQ(2,1,$MENUUNCHECKED)
  ! �b�ﶵcos�e���Ӥ�
  result=ModifyMenuFlagsQQ(2,2,$MENUCHECKED)
  call Draw_Func(f2)
  return
end subroutine
!
! �e�X�ҶǤJ����ƹϧΨ�
!
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

  call ClearScreen($GCLEARSCREEN) ! �M���ù�
  ! �]�w�޿�y�нd��j�p	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! �ί��ޭȪ���k�ӳ]�w�C��
  result=SetColor(2)   ! ���w��2���O���ӬO���
  call MoveTo(10,20,t) ! ���ʵe���������(10,20)
  
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
  
  ! �]�w�{��������,�����|�~��O�d
  result=SetExitQQ(QWIN$EXITPERSIST)
end subroutine Draw_Func
!
! �ҭnø�Ϫ����
!
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
