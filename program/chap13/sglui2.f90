module sgl_util
  use sgl
  implicit none
  integer, save :: x=0
  integer, save :: y=0
contains
subroutine display()
  integer, parameter :: size = 10
  call sglClearBuffer()
  call sglColor3i(255,255,255)
  call sglDrawLine(x-size, y-size, x+size, y+size)
  call sglDrawLine(x+size, y-size, x-size, y+size)
  call sglUpdateBuffer()
  return
end subroutine
subroutine MouseMove(mx,my)
  integer mx,my
  x = mx
  y = my
  call display()
  return
end subroutine
subroutine MouseDown(key)
  integer key
  write(*,"('Push mouse button ',I1)") key
end subroutine
subroutine MouseUp(key)
  integer key
  write(*,"('Release mouse button ',I1)") key
end subroutine
end module

program main
  use sgl_util
  implicit none
  ! �]�w�ƹ��b���������ʮ�, �|�I�sMouseMove
  call sglMouseMoveSub(MouseMove)
  ! �]�w�ƹ��b�������U���s��, �|�I�sMouseDown
  call sglMouseDownSub(MouseDown) !
  ! �]�w�ƹ��b�����P�}���s��, �|�I�sMouseDown
  call sglMouseUpSub(MouseUp)
  call sglDisplaySub(display)
  call sglCreateWindow(100,100,400,400,1)
  call sglShowCursor(0) ! ���ç@�~�t�Ϊ��ƹ����
  call sglMainLoop()
  stop
end program