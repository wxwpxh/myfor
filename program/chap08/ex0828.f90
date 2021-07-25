program  ex0828
  implicit none
  integer :: n
  integer, external :: fact
  write(*,*) 'N='
  read(*,*) n
  write(*, "(I2,'! = ',I8)" ) n, fact(n)
  stop
end

recursive integer function fact(n) result(ans)
  implicit none
  integer , intent(in) :: n
  
  if ( n < 0 ) then ! ���X�z����J
	ans = -1        ! �H�K�]�w�@�ӭ�
	return          ! n���X�z, ����return 
  else if ( n <= 1 ) then
    ans = 1          
    return          ! ���ΦA�V�U���j�F, return 
  end if
  ! �|�����o, �N��n>1, �qn*(n-1)!�ӭp��n!
  ans = n * fact(n-1) 
  return
end
