program ex0816
implicit none
  integer :: a(5) = (/ 1,2,3,4,5 /)
  call ShowOne(a)   ! �ǤJa, �]�N�O�ǤJ�}�Ca��1�Ӥ������O�����}
  call ShowArray5(a)  
  call ShowArray3(a)  
  call ShowArray3( a(2) ) ! �ǤJa(2), �]�N�O�ǤJ�}�Ca��2�Ӥ������O�����}
  call ShowArray2X2(a)  
  stop
end

subroutine ShowOne(num)
implicit none
  integer :: num ! �u���X�ѼƦ�}������1�ӼƦr
  write(*,*) num
  return
end

subroutine ShowArray5(num)
implicit none
  integer :: num(5) ! ���X�ѼƦ�}�����e5�ӼƦr,���}�C�Өϥ�
  write(*,*) num
  return
end

subroutine ShowArray3(num)
implicit none
  integer :: num(3) ! ���X�ѼƦ�}�����e3�ӼƦr,���}�C�Өϥ�
  write(*,*) num
  return
end

subroutine ShowArray2X2(num)
implicit none
  integer :: num(2,2) ! ���X�ѼƦ�}�����e4�ӼƦr,��2X2�}�C�Өϥ�
  write(*,*) num(2,1), num(2,2)
  return
end