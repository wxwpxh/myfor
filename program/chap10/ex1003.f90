program  ex1003
  implicit none
  integer, pointer :: a=>null()
  integer, target  :: b=1,c=2

  write(*,*) associated(a)   ! FALSE, ����a�|�����w
  a=>c 
  write(*,*) associated(a)   ! TRUE, ����a�w���w
  write(*,*) associated(a,c) ! TRUE, ����a���Vc
  write(*,*) associated(a,b) ! FALSE, ����a�����Vb
  nullify(a)                 ! �����a�]���S�����V
  write(*,*) associated(a)   ! FALSE, ����a�|�����w

  stop
end
