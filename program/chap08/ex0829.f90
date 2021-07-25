program  ex0829
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
  integer, save :: count = 1
  integer :: localcount, temp  ! �����ܼ�
    
  localcount = count
  count = count+1
  write(6,"(I2,'th enter, n=',I2)") localcount, n

  if ( n < 0 ) then ! ���X�z����J
	ans = -1        ! �H�K�]�w�@�ӭ�
    write(6,"(I2,'th exit, n=',I2,' ans=',I8)") localcount, n, ans
	return          ! n���X�z, ����return 
  else if ( n <= 1 ) then
    ans = 1          
    write(6,"(I2,'th exit, n=',I2,' ans=',I8)") localcount, n, ans
    return          ! ���ΦA�V�U���j�F, return 
  end if
  ! �|�����o, �N��n>1, �qn*(n-1)!�ӭp��n!
  temp = n-1
  ans = n * fact(temp) 
  write(6,"(I2,'th exit, n=',I2,' ans=',I8)") localcount, n, ans
  return
end
