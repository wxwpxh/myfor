program ex0807
implicit none
  real :: a=1
  real :: b=2
  real, external :: add

  write(*,*) add(a,b)
  stop
end

function add(a,b)
implicit none
  real :: a,b ! �ǤJ���Ѽ�
  real :: add 
  ! add���ƦW�٤@�ˡA�o�䤣�O�Ψӫŧi�ܼơA
  ! �O�ŧi�o�Ө�Ʒ|�Ǧ^���ƭȫ��A
  add = a+b
  return
end