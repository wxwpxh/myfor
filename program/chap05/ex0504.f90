program ex0504
implicit none
  integer rain, windspeed
  logical r,w

  write(*,*) "Rain:"
  read(*,*) rain
  write(*,*) "Wind:"
  read(*,*) windspeed

  r = (rain>=500)     ! �p�Grain>=150, r=.true, ���Mr=.false.
  w = (windspeed>=10) ! �p�Gwindspeed>=10, w=.true, ���Mw=.false.

  if ( r .or. w ) then ! �u�nr��w���@�ӭȬOtrue�N����
    write(*,*) "����W�Z�W��"
  else
    write(*,*) "�ӱ`�W�Z�W��"
  end if

stop
end