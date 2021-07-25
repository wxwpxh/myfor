module func
! person���A�̤֦���18 bytes
! �]������10�Ӧr���Ψ�ӯB�I��
type person
  character(len=10) :: name
  real :: height, weight
end type
! pperson���A�q�`����4 bytes
! �]�����ح��u���@�ӫ���, ���ЦbPC���T�w�ϥ�4 bytes
type pperson
  type(person), pointer :: p
end type

contains 
subroutine sort(p)
  implicit none
  type(pperson) :: p(:)
  type(pperson) :: temp
  integer i,j,s

  s = size(p,1)
  do i=1,s-1
    do j=i+1, s
	  if ( p(j)%p%height < p(i)%p%height ) then
	    temp = p(i)
		p(i) = p(j)
		p(j) = temp
	  end if
	end do
  end do

  return
end subroutine

end module

program ex1009
  use func
  implicit none
  type(person), target :: p(5) = (/ person("���P��", 180.0, 75.0), &
                                    person("���P��", 170.0, 65.0), &
							        person("�B�P��", 175.0, 80.0), &
							        person("���P��", 182.0, 78.0), &
							        person("�\�P��", 178.0, 70.0)  &
						         /) 
  type(pperson) :: pt(5)
  integer i
  ! ��pt�}�C�������Х������V�}�Cp
  forall(i=1:5)
    pt(i)%p => p(i)
  end forall
  ! �̷Ө����q�p��j�Ƨ�
  call sort(pt)
  ! ��X�ƧǪ����G
  write(*,"(5(A8,F6.1,F5.1/))") (pt(i)%p, i=1,5)

  stop
end
