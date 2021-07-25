program main
    implicit none 
    !  input  Fibonacci sequences

    real*8::f(100)
    integer::i,m
    print*,"Please input the number you love"
    read(*,*)m
    i=1
    ! 数组置零，利用EXIT跳出循环
   do while ( .true. )

    f(i)=0
    i=i+1
    if(i>100) exit
   end do

    f(1)=0
    f(2)=1
   xunhuan: Do i=3,m,1

        f(i)=f(i-1)+f(i-2)

    End Do xunhuan

    write(*,100)f(1:m)
100   format(T5,'The Fibonacci sequence are : ',/,5(F15.2))

end program
