! gfortran HelloWorld.f95 -o HelloWorld
program main                !程序开始，main是program的名字，完全自定义
      write(*,*) "Hello"    !主程序
      stop                  !终止程序
end program main            !end用于封装代码
