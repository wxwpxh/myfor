module typedef
  type student
	integer :: Chinese, English, Math, Natural, Social
	integer :: total
  end type
end module

program ex0921
  use typedef
  implicit none
  integer, parameter :: fileid=10
  integer, parameter :: students=20
  character(len=80)  :: tempstr
  type(student) :: s(students) ! �x�s�ǥͦ��Z
  type(student) :: total       ! �p�⥭�����ƥ�
  integer i, num, error

  open(fileid, file="grades.txt",status="old", iostat=error)
  if ( error/=0 ) then
    write(*,*) "Open grades.txt fail."
	stop
  end if

  read(fileid, "(A80)") tempstr ! Ū�J�Ĥ@���r
  total=student(0,0,0,0,0,0)
  ! �ΰj��Ū�J�C��ǥͪ����Z
  do i=1,students
    read(fileid,*) num, s(i)%Chinese, s(i)%English, &
	               s(i)%Math, s(i)%Natural, s(i)%Social      
	! �p���`��
	s(i)%Total = s(i)%Chinese + s(i)%English + &
	             s(i)%Math + s(i)%Natural + s(i)%Social             
	! �֥[�W�U�쪺����, �p��U�쥭���ɨϥ�
	total%Chinese = total%Chinese + s(i)%Chinese
	total%English = total%English + s(i)%English
	total%Math    = total%Math + s(i)%Math
	total%Natural = total%Natural + s(i)%Natural
	total%Social  = total%Social + s(i)%Social
	total%Total   = total%Total + s(i)%Total
  end do
  ! ���s��X�C��ǥͦ��Z
  write(*,"(7A7)") "�y��","���","�^��","�ƾ�","�۵M","���|","�`��"
  do i=1,students
    write(*,"(7I7)") i, s(i)
  end do
  ! �p��ÿ�X���ʤ���
  write(*,"(A7,6F7.1)") "����", &
	real(total%Chinese)/real(students),&
	real(total%English)/real(students),&
	real(total%Math)   /real(students),&
	real(total%Natural)/real(students),&
	real(total%Social) /real(students),&
	real(total%Total)  /real(students)

  stop
end program