      program readGrade
      integer num,grade,i,j
      i=3
      j=1
      print *,"input",i,"stu no & grade:"
10    read *,num,grade
      if(grade .GT. 80) then
          print *,num,grade
      end if
      j=j+1
      if (j .LE. i) goto 10
      end
