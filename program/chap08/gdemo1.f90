program gdemo1
  use TextGraphLib
  implicit none
  
  call SetScreen( 10, 10 )      ! �]�w�ѪR�׬�10x10
  call DrawLine( 1, 1, 10, 10 ) ! �b(1,1)��(10,10)�o���I���e�@���u
  call UpdateScreen()           ! ���ø�Ϫ����G

  stop
end