program main
  implicit none
  integer age, money
  real tax

  write(*,*) "�п�J�~��"
  read(*,*) age
  write(*,*) "�п�J�~���J"
  read(*,*) money

  if ( age<50 ) then
    if ( money<240000 ) then
	  tax = 0.07
	else if ( money<480000 )then
	  tax = 0.10
	else
	  tax = 0.15
	end if
  else
    if ( money<240000 ) then
	  tax = 0.5
	else if ( money<480000 )then
	  tax = 0.7
	else
	  tax = 0.10
	end if
  end if
  
  write(*,"(' �|���� 'I8)") nint(money*tax)

end program