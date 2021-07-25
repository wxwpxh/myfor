program main
implicit none
integer::a=5
real(kind=8)::pi=3.14
complex::c=(12.6,8.01)
character(len=80)::string="good good study,day day up!"
write(*,*)a,pi,c,string(1:76)
end program main
