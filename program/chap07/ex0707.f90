program ex0707
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: m(row, col)
  integer r ! �Ψӫ��wrow
  integer c ! �Ψӫ��wcolumn
  data ((m(r,c), r=1, 2), c=1,2) /1,2,3,4/

  ! �̧ǿ�Xm(1,1), m(2,1), m(1,2), m(2,2)�o4�ӼƦr,  
  write(*,"(I3,I3,/,I3,I3)") (( m(r,c), c=1,2 ), r=1,2)

  stop
end
