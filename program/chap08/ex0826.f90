program  ex0826
  implicit none
  interface
    subroutine sub(a,b) ! 定義副程式sub的使用介面
    implicit none
    integer :: a
    integer, optional :: b
    end subroutine sub
  end interface

  call sub(1)   ! 使用1個參數
  call sub(2,3) ! 使用2個參數
  stop
end program ex0817

subroutine sub(a,b)
  implicit none
  integer :: a
  integer, optional :: b
  write(*,*) present(a)
  if ( present(b) ) then ! 有傳入b時
    write(*,"('a=',I3,' b=',I3)") a,b ! 
  else                   ! 沒有傳入b時
    write(*,"('a=',I3,' b=unknown')") a
  end if
  return
end subroutine sub
