program ex0513
implicit none
  real a,b,ans
  character operator
  
  read(*,*) a
  read(*,"(A1)") operator ! ���ϥή榡���Ǿ����|Ū���찣��"/" 
  read(*,*) b

  select case(operator)
  case('+')
    ans = a+b
  case('-')
    ans = a-b
  case('*')
    ans = a*b
  case('/')
    ans = a/b
  case default ! ��J�䥦�Ÿ����B�z
    write(*,"('Unknown operator ',A1)") operator
	stop ! ���G�{��
  end select

  write(*,"(F6.2,A1,F6.2,'=',F6.2)") a,operator,b,ans

  stop
end