program gdemo2
  use TextGraphLib
  implicit none
  
  call SetScreen( 20, 20 )
  call SetCurrentChar('o')       ! ���o�ӧ@����R�r��
  call DrawCircle( 8, 4 , 3, 4)  ! �e��
  call SetCurrentChar('#')       ! ���#�ӧ@����R�r��
  call DrawFilledRect( 4, 8, 13, 18 )  ! �e�x��
  call UpdateScreen()            ! ���ø�ϵ��G

  stop
end