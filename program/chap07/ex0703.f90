program ex0703
implicit none
  integer, parameter :: classes  = 5
  integer, parameter :: students = 5
  integer :: student(students, classes)
  integer s ! �Ψӫ��w�ǥ͸��X
  integer c ! �Ψӫ��w�Z�Ÿ��X 

  do c=1, classes
    do s=1, students
      write(*,"('Number ',I2,' of class ',I2)") s,c
      read(*,*) student(s,c) ! ��c�Z����s��ǥ�
    end do
  end do

  do while( .true. )
    write(*,*) "class:"
    read(*,*) c
    if ( c<=0 .or. c>classes ) exit  
	write(*,*) "student:"
	read(*,*) s
    if ( s<=0 .or. s>students ) exit 
    write(*,"('score:',I3)") student(s,c) ! ��c�Z����s��ǥ�
  end do

  stop
end
