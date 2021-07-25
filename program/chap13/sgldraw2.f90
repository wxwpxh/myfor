module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    call sglClearBuffer() ! �M���e��
	call sglColor3f(1.0,0,0) ! �ϥά���
	call sglRectV(0.2, 0.2, 0.8, 0.8) ! �H(0.2,0.2)�M(0.8,0.8)���ݵe�x��
    call sglColor3i(0,255,0) ! �ϥκ��
    call sglCircleV(0.5,0.5,0.5) ! �H(0.5,0.5)�����, �e�b�|��0.5����
	call sglColor3i(0,0,255) ! �ϥ��Ŧ�
	call sglLineV(0.5,0, 0.5, 1.0) ! �b(250,0)��(250,500)���I���e�u
	call sglLineV(0.0,0.5, 1.0,0.5) ! �b(0,250)��(500,250)���I���e�u
	call sglUpdateBuffer();
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display)
  ! �]�w�������W���������y�Ь�(0,0)�k�U����(1.0,1.0)
  call sglSetVirtual(0.0, 0.0, 1.0, 1.0)
  call sglCreateWindow(100,100,500,500,1)
  call sglMainLoop()
  stop
end program