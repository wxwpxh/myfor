program ex0501
implicit none
  real(kind=4) :: speed
  write(*,*) "speed:"
  read(*,*) speed
  if ( speed > 100.0 ) then
    ! speed > 100 �ɤ~�|����U���o�@��{�� 
    write(*,*) "Slow down." 
  end if 
stop
end