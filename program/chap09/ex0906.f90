module typedef
  type student
    integer Chinese,English,Math
  end type
end module

program ex0906
  use typedef
  implicit none
  integer :: students
  type(student), allocatable :: s(:)
  character(len=80) :: filename = "data.txt"
  integer, parameter :: fileid = 10
  integer :: i

  write(*,*) "�Z�W���h�־ǥ�?"
  read (*,*) students
  allocate( s(students), stat=i )
  if ( i/=0 ) then
    write(*,*) "Allocate buffer fail."
	stop
  end if
  
  open(fileid, file=filename)
  do i=1,students
    write(*,"('�п�J'I2'���P�Ǫ����B�^��μƾǦ��Z')") i
    read(*,*) s(i)%Chinese, s(i)%English, s(i)%Math
	write(fileid,"('�y��:'I2/'���:'I3' �^��:'I3' �ƾ�:'I3)") i,s(i)
  end do
  close(fileid)

  stop
end
