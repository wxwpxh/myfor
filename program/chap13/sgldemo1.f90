program main
  use sgl
  implicit none
  external display ! �ŧidisplay�O�Ө禡
  ! �]�w������ݭn��ø��,�|�I�s�Ƶ{��display
  call sglDisplaySub(display)  
  ! �}�ҵ���, �������W
  ����(100,100), ���e�P��500
  call sglCreateWindow(100,100,500,500,0)
  write(*,*) "Waiting message."
  ! ���ݨϥΪ̵��{�����T��
  call sglMainLoop()
  write(*,*) "The End."
  stop
end
! �C������ݭn��s�e����, �|�I�sdisplay
subroutine display()
  use sgl
  implicit none
  call sglClearBuffer()          ! �����ù�
  call sglColor3f(1.0,0.0,0.0)   ! �]�w�ثe�n�ϥά����ø��
  call sglDrawLine(0,0, 500,500) ! �b(0,0)��(500,500)���I�����e�u
  return
end subroutine