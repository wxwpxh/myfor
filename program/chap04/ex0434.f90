program  ex0434
implicit none
! �}�l�إ�person�o�ӫ��A
type :: person 
  character(len=30) :: name ! �H�W
  integer  ::  age          ! �~��
  integer  ::  height       ! ����			
  integer  ::  weight       ! �魫
  character(len=80) :: address ! �a�}
end type person

type(person) :: a ! �ŧi�@��person���A���ܼ�

write(*,*) "NAME:"
read(*,*)  a%name 
write(*,*) "AGE:"
read(*,*)  a%age
write(*,*) "HEIGHT:"
read(*,*)  a%height
write(*,*) "WEIGHT:"
read(*,*)  a%weight
write(*,*) "ADDRESS:"
read(*,"(A80)") a%address

write(*,100) a%name,a%age,a%height,a%weight
100 format("Name:",A10/,"Age:",I3/,"Height:",I3/,"Weight:",I3,&
           &"Addres:",A50)

stop
end
