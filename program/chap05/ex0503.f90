program ex0503
implicit none
  integer rain, windspeed

  write(*,*) "Rain:"
  read(*,*) rain
  write(*,*) "Wind:"
  read(*,*) windspeed

  if ( rain>=500 .or. windspeed >=10 ) then
    write(*,*) "����W�Z�W��"
  else
    write(*,*) "�ӱ`�W�Z�W��"
  end if

stop
end