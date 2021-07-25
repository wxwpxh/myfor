      program numstr
      integer num
          real    r1
      character*20 str1,str2,str3

      num=11
      str1='11'
      str2='22222.22'
      str3='33'
C number to string
      write(str1,'(f7.4)') 54.34
      print*,str1
C string to number
      read(str1,"(i2)")num
      print*,num
      read(str2,'(F4.2)') r1
      print*,r1   
      end
