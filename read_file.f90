PROGRAM read_file
IMPLICIT NONE
CHARACTER(len = 20)::filename    ! 文件名称
CHARACTER(len = 80)::msg          ! 打开文件错误时的异常信息
INTEGER::nvals = 0                       ! 读取数据的行数
INTEGER::status1 , status2            ! 打开文件和读取数据的状态信息
REAL::value                                   ! 需读取文件中的数据

WRITE(*,*) 'Please enter input file name'    ! 读取需要打开的文件
READ(*,*) filename
WRITE(*,1000) filename
1000 FORMAT('The input file name is: ' , A)

OPEN(UNIT = 3 , FILE = filename , STATUS = 'OLD' , ACTION = 'READ' , IOSTAT = status1 , IOMSG = msg)  ! 打开文件

openif:IF(status1 == 0 ) THEN    ! 文件打开成功
    readloop:DO
    READ(3 , * , IOSTAT = status2) value
    IF(status2 /= 0) EXIT      ! 如果数据读取失败，跳出DO循环
    nvals = nvals + 1
    WRITE(*,1010) nvals,value
    1010 FORMAT('Line ',I6,' :Value = ',F10.4)
    END DO readloop
    readif:IF(status2 > 0) THEN      ! 发生了数据读取错误
        WRITE(*,1020) nvals+1
        1020 FORMAT('An error occurred reading line ',I6)        ! 交代在哪一行读取数据失败
        ELSE readif     ! 到达数据结尾
        WRITE(*,1030) nvals
        1030 FORMAT('End of file reached.There were ' , I6 , ' values in the file.')   ! 交代已经到达文件结尾
    END IF readif
ELSE openif         ! 文件打开失败
    WRITE(*,1040) status1
    1040 FORMAT('Error opening file : IOSTAT = ',I6)
    WRITE(*,1050) TRIM(msg)   ! 返回错误信息
    1050 FORMAT(A)   
END IF openif

CLOSE(UNIT = 3)     ! 关闭文件

STOP 
END PROGRAM read_file
