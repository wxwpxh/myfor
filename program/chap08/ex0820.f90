program ex0820
implicit none
  call sub()
  call sub()
  call sub()
  stop
end program

subroutine sub()
  implicit none
  integer,save:: count = 1
  write(*,*) count
  count = count+1
  return
end