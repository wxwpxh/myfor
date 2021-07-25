!// ForQuill v1.01 Beta www.fcode.cn
! http://quill.fcode.cn/
! gfortran ex2.f -o ex2
! MAIN PROGRAM
Program ex
  Print *, 'radius=', 1.0, ' Circumference=', circumference(1.0)
  Print *, 'radius=', 3.0, ' Circumference=', circumference(3.0)
  Print *, 'radius=', 12.0, ' Circumference=', circumference(12.0)
  Print *, 'radius=', 5.0, ' Circumference=', circumference(5.0)
End Program ex

! SUBPROGRAM
Function circumference(r)
  pi = 3.1415926
  circumference = 2*pi*r
  Return
End Function circumference
