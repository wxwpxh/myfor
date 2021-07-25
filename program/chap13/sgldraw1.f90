module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    write(*,*) "Update"
    call sglClearBuffer() ! �M���e��
	call sglColor3f(1.0,0,0) ! �ϥά���
	call sglRect(100,100,300,300) ! �H(100,100)�M(300,300)���ݵe�x��
    call sglColor3i(0,255,0) ! �ϥκ��
    call sglCircle(200,200,200) ! �H(200,200)�����, �e�b�|��200����
	call sglColor3i(0,0,255) ! �ϥ��Ŧ�
	call sglLine(200,0, 200,400) ! �b(200,0)��(200,400)���I���e�u
	call sglLine(0,200, 400,200) ! �b(0,200)��(400,200)���I���e�u
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display) ! �]�w������s�ɩI�sDisplay
  ! �}��ø�ϵ���, ���W����(100,100), �e���P��400
  call sglCreateWindow(100,100,400,400,0)
  ! �i�J���ݰT�����j��
  call sglMainLoop()
  stop
end program