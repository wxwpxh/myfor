program main
  implicit none
  integer, parameter :: answer = 45
  integer, parameter :: max = 5
  integer weight, i
  
  do i=1,max
    write(*,*) "�п�J�魫"
	read(*,*) weight
	if ( weight==answer ) exit
  end do

  if ( i<=max ) then
    write(*,*) "�q��F"
  else
    write(*,*) "�q���F"
  end if

  stop
end program
