program ex0825
implicit none
  interface ! �w�q�禡func���ϥΤ���
    function random10(lbound, ubound)
	implicit none
	real :: lbound, ubound
	real :: random10(10) ! �Ǧ^�ȬO�Ӱ}�C
	end function
  end interface
  real :: a(10)
  CALL RANDOM_SEED()     ! �w�s�Ƶ{��, �ϥζüƫe�I�s
  a = random10(1.0, 10.0)! ����10��1.0��1.0�������ü�
  write(*,"(10F6.2)") a  ! ��X�}�Ca�����e
end

! random10�|�Ǧ^10�ӽd��blbound��ubound�������ü�
function random10(lbound, ubound)
implicit none
  real :: lbound, ubound
  real :: len
  real :: random10(10)
  real    t
  integer i
  len = ubound - lbound  ! �p��d��j�p
  do i=1,10
    call random_number(t) ! t�|�O0��1�������ü�
    random10(i) = lbound + len * t ! ��t�ഫ��lbound��ubound�����ü�
  end do
  return
end