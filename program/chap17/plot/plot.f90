! ²�檺ø�ϥܽd
! By Perng 1997/9/19
program Plot_Demo
! �ϥ�Visual Fortran��ø�ϥ\��ɻݭnmodule dflib
use DFLIB	
implicit none
  type(xycoord) :: t
  integer :: result
  call MoveTo(10,10,t)  ! ��ثeø�Ϫ���m���ʨ�y��(10,10)
  result=LineTo(100,50) ! �q(10,10)��(100,50)��ø�@�����u
  ! ø�@�ӥ��W����(110,10), �k�U����(150,50)����ߤ��
  result=Rectangle( $GFILLINTERIOR, 110,10, 150, 50 )
  ! ø�@�ӥi�H��J�b(10,60)--(150,100)��η����Ť߾��
  result=Ellipse($GBORDER, 10, 60, 150, 100)
end program Plot_Demo
