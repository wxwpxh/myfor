program main
  implicit none
  integer day
  character(len=20) :: tv

  write(*,*) "�п�J�P���X"
  read(*,*) day

  select case(day)
  case(1,4)
    tv = "�s�D"
  case(2,5)
    tv = "��@"
  case(3,6)
    tv = "�d�q"
  case(7)
    tv = "����"
  case default
    write(*,*) "���~����J"
	stop
  end select 
  write(*,*) tv

end program