program ch1207
implicit none
integer :: fluid
real :: litres
real :: pints
  PRINT *,' Pints       Litres'
  do fluid=1,10
    litres = fluid / 1.75
    pints  = fluid * 1.75
    print 100 , pints,fluid,litres
    100 format(' ',f7.3,' ',i3,' ',f7.3)
  end do
end program ch1207

