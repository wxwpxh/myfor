program main
  implicit none
  real, parameter :: PI=3.14159
  real radius
  write(*,*) "�п�J�b�|��"
  read(*,*) radius
  write(*,"(' ���n='f8.3)") radius*radius*PI
end program

