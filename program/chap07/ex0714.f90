program ex0714
implicit none
  integer I,J
  integer, parameter :: size = 5
  integer :: a(size,size)

  forall ( I=1:size, J=1:size, I>J )  a(I,J)=1 ! �W�b����
  forall ( I=1:size, J=1:size, I==J ) a(I,J)=2 ! �﨤�u����
  forall ( I=1:size, J=1:size, I<J )  a(I,J)=3 ! �U�b����

  write(*,"(5(5I5,/))") a

  stop
end

