program ch1303
implicit none
real    :: x
  read 100,x
  100 format(e10.0)
  print *,x
  read 200,x
  200 format(e10.4)
  print *,x
  read 300,x
  300 format(e10.10)
  print *,x
  read *,x
  print *,x
  read 100,x
  print *,x
  read 200,x
  print *,x
  read 300,x
  print *,x
  read *,x
  print *,x
end program ch1303


