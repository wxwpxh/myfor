program main
  implicit none
  integer money
  real    tax
  
  write(*,*) "�п�J�~���J"
  read(*,*) money

  if ( money<240000 ) then
    tax = 0.07
  else if ( money<480000 ) then
    tax = 0.1
  else
    tax = 0.15
  end if
  write(*,"(' �|���� 'I8)") nint(money*tax)

end program