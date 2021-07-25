program ex0809
implicit none
  integer, parameter :: players = 5
  real :: angle(players) = (/ 30.0, 45.0, 35.0, 50.0, 40.0 /)
  real :: speed(players) = (/ 25.0, 20.0, 21.0, 27.0, 22.0 /)
  real :: distance(players)
  real, external :: Get_Distance ! �ŧiGet_Distance�O�Ө��
  integer :: I

  do I=1, players
     distance(i) = Get_Distance( angle(i), speed(i) )
	 write(*,"('Player ',I1,' =',F8.2)") I, distance(i)
  end do

  stop
end
! ��0��360�������ഫ��0��2PI���|��
real function Angle_TO_Rad( angle )
  implicit none
  real angle
  real, parameter :: pi=3.14159

  Angle_TO_Rad = angle*pi/180.0
  
  return
end
! �Ѩ��סB���u�t�רӭp���g�Z��
real function Get_Distance( angle, speed )
implicit none
  real angle, speed  ! �ǤJ���Ѽ�
  real rad, Vx, time ! �����ϥ�
  real, external  :: Angle_TO_Rad ! �ŧiAngle_TO_Rad�O�Ө��
  real, parameter :: G=9.81

  rad  = Angle_TO_Rad( angle )    ! ����ഫ
  Vx   = speed*cos(rad)           ! ������V�t��
  time = 2.0*speed*sin(rad) / G   ! �b�Ť�����ɶ�
  Get_Distance = Vx * time        ! �Z�� = ������V�t�� * ����ɶ�

  return
end
