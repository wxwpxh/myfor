program  ex0801
implicit none
  call message() ! �I�s�Ƶ{��message
  call message()
  stop
end 
! �Ƶ{��message
subroutine message()
implicit none
  write(*,*) "Hello."
  return
end