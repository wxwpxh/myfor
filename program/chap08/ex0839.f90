program ex0839
  implicit none
  integer :: a

  read(*,*) a
  call sub( a, *100, *200 ) 
  ! �S�O�t�~���w��ӧ���I, ���O�O��N�X100��200�o��Ӧa��
  write(*,*) "Default"
  stop
  100 write(*,*) "Return 1"
  stop
  200 write(*,*) "Return 2"
  stop 

end 

subroutine sub( a, *, * )
  implicit none
  integer :: a
  if ( a<=0 ) then
    return    ! ��^���w������I
  else if ( a==1 ) then
    return 1  ! ��^�S�O���w����1�ӧ���I
  else
    return 2  ! ��^�S�O���w����2�ӧ���I
  end if
end subroutine