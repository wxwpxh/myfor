module TextGraphLib
  implicit none
  integer, save   :: ScreenWidth        ! �w�q�i�H�e�Ϫ��e���e��
  integer, save   :: ScreenHeight       ! �w�q�i�H�e�Ϫ��e������
  character, save :: background  = ' '  ! �w�q�w�]�ΨӲM���e�����r��
  character, save :: CurrentChar = '*'  ! �w�q�w�]�Ψӵe�Ϫ��r�� 
  character, save, allocatable :: screen(:,:)  ! �Ψӹ�ڵe�Ϫ��O����
  integer, parameter :: segments = 100
  real, parameter    :: PI = 3.14159

contains 
! �w�q�e���j�p
subroutine SetScreen( width, height )
  implicit none
  integer, intent(in) :: width, height
  if ( allocated(screen) ) deallocate(screen)
  ScreenWidth  = width
  ScreenHeight = height
  allocate( screen(width, height) )
  if ( .not. allocated(screen) ) then
    write(*,*) "Allocate buffer error!"
	stop
  end if
  screen  = ' '
  return
end subroutine
! �k�ٰO����ϥΪŶ�
subroutine DestroyScreen()
  implicit none
  if( allocated(screen) ) deallocate(screen)
  return
end subroutine

! �M���e��
subroutine ClearScreen( c )
  implicit none
  character, optional :: c
  if ( .not. allocated(screen) ) return
  if ( present(c) ) then
    screen = c
  else
    screen = background
  end if
  return
end subroutine
! �w�q�w�]�ΨӲM���e�����r��
subroutine SetBackground( c )
  implicit none
  character :: c
  background = c
  return
end subroutine
! �w�q�w�]�Ψӵe�Ϫ��r��
subroutine SetCurrentChar( char )
  implicit none
  character :: char
  CurrentChar = char
  return
end subroutine
! ��e�n�����G��ڨq�b�ù��W
subroutine UpdateScreen()
  implicit none
  integer i
  character(len=20) :: str
  if ( .not. allocated(screen) ) return
  write( str, "('(',I3.3,'A1)')" ) ScreenWidth
  do i=1, ScreenHeight
    write(*, str) screen(:,i)
  end do
  return
end subroutine
! �b���w��(x,y)��m�e�W�@�Ӧr��
subroutine PutChar( x, y, char )
  implicit none
  integer, intent(in) :: x,y
  character, optional :: char

  if ( .not. allocated(screen) ) return
  if ( x<1 .or. x>ScreenWidth .or. y<1 .or. y>ScreenHeight ) return
  
  if( present(char) ) then
    screen(x,y) = char
  else
    screen(x,y) = CurrentChar
  end if

  return
end subroutine PutChar
! �b(x0,y0)��(x1,y1)�����e�@�����u
subroutine DrawLine(x0,y0, x1,y1)
  implicit none
  integer, intent(in) :: x0,y0
  integer, intent(in) :: x1,y1
  integer xdiff, ydiff
  integer xinc, yinc
  integer xadd, yadd
  integer x,y
  integer sum

  xdiff = x1-x0
  ydiff = y1-y0
  
  if ( xdiff > 0 ) then
    xinc = 1
	xadd = xdiff
  else if ( xdiff < 0 ) then
    xinc = -1
	xadd = -xdiff
  else 
    xinc = 0
	xadd = 0
  end if

  if ( ydiff > 0 ) then
    yinc = 1
	yadd = ydiff
  else if ( ydiff < 0 ) then
    yinc = -1
	yadd = -ydiff
  else
    yinc = 0
	yadd = 0
  end if

  sum = 0
  x = x0
  y = y0

  if ( xadd > yadd ) then
	do while(x/=x1)
	  call PutChar( x, y )
	  x = x + xinc
	  sum = sum + yadd
	  if ( sum >= xadd ) then 
	    sum = sum - xadd
		y = y + yinc
	  end if
	end do
    call PutChar( x, y )
  else
	do while(y/=y1)
	  call PutChar( x, y )
	  y = y + yinc
	  sum = sum + xadd
	  if ( sum >= yadd ) then 
	    sum = sum - yadd
		x = x + xinc
	  end if
	end do
    call PutChar( x, y )
  end if

  return
end subroutine
! �H(cx,cy)�����, �����b�b�|��radiusA, �����b�b�|��radiusB�����
subroutine DrawCircle( cx, cy, radiusA, radiusB )
  implicit none
  integer, intent(in) :: cx, cy, radiusA
  integer, optional :: radiusB
  integer ra, rb
  integer x,y, nx,ny
  integer i
  real    r, rinc
  r=0.0
  rinc = 2.0*PI/real(segments)

  if ( present(radiusB) ) then
    ra = radiusA
	rb = radiusB
  else
    ra = radiusA
	rb = radiusA
  end if
  
  
  x = cx + int(ra*sin(r)+0.5)
  y = cy + int(rb*cos(r)+0.5)
  do while( r < 2*PI )
	r = r + rinc  
    nx = cx + int(ra*sin(r)+0.5)
	ny = cy + int(rb*cos(r)+0.5)
	call DrawLine(x,y, nx,ny)
	x = nx
	y = ny
  end do

end subroutine
! �p�G1<=num<=max, �Ǧ^num��.
! num<1 �Ȧ^1
! num>max �Ȧ^max
integer function Bound(num, max)
  implicit none
  integer, intent(in) :: num, max
  bound = num
  if ( num<1 ) Bound = 1
  if ( num>max ) Bound = max
  return
end function
! �H(x0,y0)�����W��, (x1,y1)���k�U���e�@�ӪŤߪ��x��
subroutine DrawRect( x0, y0, x1, y1 )
  implicit none
  integer, intent(in) :: x0, y0, x1, y1
  integer :: rx0, ry0, rx1, ry1

  if ( .not. allocated(screen) ) return
  if ( x0>x1 .or. y0>y1 ) return

  rx0 = Bound(x0, ScreenWidth)
  ry0 = Bound(y0, ScreenHeight)
  rx1 = Bound(x1, ScreenWidth)
  ry1 = Bound(y1, ScreenHeight)

  screen(rx0:rx1, ry0) = CurrentChar
  screen(rx0:rx1, ry1) = CurrentChar
  screen(rx0, ry0:ry1) = CurrentChar
  screen(rx1, ry0:ry1) = CurrentChar

  return
end subroutine
! �H(x0,y0)�����W��, (x1,y1)���k�U���e�@�ӹ�ߪ��x��
subroutine DrawFilledRect( x0, y0, x1, y1 )
  implicit none
  integer, intent(in) :: x0, y0, x1,y1
  integer :: rx0, ry0, rx1, ry1
  
  if ( .not. allocated(screen) ) return
  if ( x0>x1 .or. y0>y1 ) return

  rx0 = Bound(x0, ScreenWidth)
  ry0 = Bound(y0, ScreenHeight)
  rx1 = Bound(x1, ScreenWidth)
  ry1 = Bound(y1, ScreenHeight)

  screen( rx0:rx1 , ry0:ry1 ) = CurrentChar

  return
end subroutine

end module