program ex0716
implicit none
  integer :: students
  integer, allocatable :: a(:) ! �ŧi�@�ӥi�ܤj�p���@���}�C
  integer :: i
    
  write(*,*) "How many students:"
  read(*,*) students
  allocate( a(students) ) ! �t�m�O����Ŷ�

  ! ��J���Z
  do i=1,students
    write(*,"('Number ',I3)") i
    read(*,*) a(i)
  end do

  stop
end
