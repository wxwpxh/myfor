program ex0822
  implicit none
  external sub1, sub2 ! �ŧisub1��sub2�O�Ƶ{���W��
  call sub(sub1)      ! ��Ƶ{��sub1��ѼƶǥX�h
  call sub(sub2)      ! ��Ƶ{��sub1��ѼƶǥX�h
  stop
end program

subroutine sub(sub_name)
  implicit none
  external sub_name ! �ŧisub_name�O�ӰƵ{��
  call sub_name()   ! �I�s�ǤJ���Ƶ{��sub_name
  return
end subroutine

subroutine sub1()
  implicit none
  write(*,*) "sub1"
end subroutine

subroutine sub2()
  implicit none
  write(*,*) "sub2"
end subroutine
