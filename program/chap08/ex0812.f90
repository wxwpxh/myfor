program ex0812
implicit none
  integer :: a,b
  common a,b          ! a,b��b����W�������ܼƪŶ���
  integer :: c,d
  common /group1/ c,d ! c,d��bgroup1�������ܼƪŶ���
  integer :: e,f
  common /group2/ e,f ! e,f��bgroup2�������ܼƪŶ���

  write(*,"(6I4)") a,b,c,d,e,f

  stop
end

block data
implicit none
  integer a,b
  common  a,b          ! a,b��b����W�������ܼƪŶ���
  data    a,b /1,2/    ! �]�wa,b�����
  integer c,d
  common  /group1/ c,d ! c,d��bgroup1�������ܼƪŶ���
  data    c,d /3,4/    ! �]�wc,d�����
  integer e,f
  common  /group2/ e,f ! e,f��bgroup2�������ܼƪŶ���
  data    e,f /5,6/    ! �]�we,f�����
end block data
