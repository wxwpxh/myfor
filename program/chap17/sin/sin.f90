! sin��ƪ�ø�ϥܽd
program Plot_Sine
 use DFLIB
implicit none
  integer, parameter :: lines=500	! �Φh�ֽu�q�ӵe��Ʀ��u
  real(kind=8), parameter :: X_Start=-5.0	! x�b�̤p�d��
  real(kind=8), parameter :: X_End=5.0		! x�b�̤j�d��	
  real(kind=8), parameter :: Y_Top=2.0		! y�b�̤j�d�� 
  real(kind=8), parameter :: Y_Bottom=-2.0	! y�b�̤p�d��
  integer :: result			! ���^ø�Ϩ�ƹB�@���A
  integer(kind=4) :: color	! �]�w�C���
  real(kind=8) :: step		! �j�骺�W�q
  real(kind=8) :: x,y		! ø�Ϯɨϥ�,�C���p�u�q���s��
  real(kind=8) :: NewX,NewY	! (x,y)��(NewX,NewY)
  real(kind=8), external :: f ! ��ø�Ϫ����
  type(wxycoord) :: wt		! �Ǧ^�W�@�����޿�y�Ц�m
  type(xycoord)  :: t		! �Ǧ^�W�@������ڮy�Ц�m

  ! �]�w�޿�y�нd��j�p	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! �ί��ޭȪ���k�ӳ]�w�C��
  result=SetColor(2)   ! ���w��2���O���ӬO���
  call MoveTo(10,20,t) ! ���ʵe���������(10,20)
  call OutGText("f(x)=sin(x)")  ! �g�X���e
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
    y=f(x)			! �u�q�������I
	NewX=x+step		
	NewY=f(NewX)	! �u�q���k���I
	call MoveTo_W(x,y,wt)
	result=LineTo_W(NewX,NewY)
  end do
  ! �]�w�{��������,�����|�~��O�d
  result=SetExitQQ(QWIN$EXITPERSIST)
end
! �ҭnø�Ϫ����
real(kind=8) function f(x)
implicit none
  real(kind=8) :: x
  f=sin(x)
  return
end function f