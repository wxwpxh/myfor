program ex0817
implicit none
  integer, parameter :: size = 5
  integer :: s = size
  integer :: a(size) = (/ 1,2,3,4,5 /)
  call UseArray1(a,size) ! ��`��size�ǤJ���}�C�j�p
  call UseArray1(a,s)    ! ��@���ܼ�s �ǤJ���}�C�j�p
  call UseArray2(a)      ! ���ǤJ�}�C�j�p
  call UseArray3(a)
  stop
end

subroutine UseArray1(num, size)
implicit none
  integer :: size 
  integer :: num(size) ! �ǤJ���}�C�j�p�i���ܼƨӫ��w
  write(*,*) num
  return
end

subroutine UseArray2(num)
implicit none
  integer :: num(*) ! �����w�}�C�j�p
  integer :: i
  write(*,*) (num(i), i=1,5) 
  ! �p�G�ǤJ���}�C�j�p�֩�5, write�b����ɷ|�X�{���~
  return
end

subroutine UseArray3(num)
implicit none
  integer :: num(-2:2) ! �i�H���s�w�q�}�C�y�нd��
  write(*,*) num(0)
  return
end
