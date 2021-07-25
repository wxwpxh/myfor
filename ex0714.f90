program ex0714
    implicit none
    integer::a(10,5)
    integer i,j
    forall(i=2:10:2,j=1:5)
        a(i,j)=i+j
    end forall
    do i = 1 , 10
        do j = 1 , 5
            write(*,"('a('i3','i3')=',i3)")i,j,a(i,j)
        end do
    end do
    stop
end
