program main
implicit none

type::book                    ! 定义一个名叫book的新变量类型
	character(len=80)::name   ! 记录输的名字
	character(len=80)::author ! 记录作者
	integer::totalpage        ! 记录全书的页码数
end type book                 ! 结束类型自定义

type::person 
	integer :: age 
	real:: height
end type person

type(book)::a
type(person)::p

a=book("Gone with the wind","Margaret Munnerlyn Mitchell",1608)
write(*,*)a

p=person(25,169.8)
write(*,*)p



end program main
