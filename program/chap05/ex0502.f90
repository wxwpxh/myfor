program ex0502
implicit none
  real(kind=4) :: height ! �O������
  real(kind=4) :: weight ! �O���魫

  write(*,*) "height:"
  read(*,*)   height     ! Ū�J����
  write(*,*) "weight:"
  read(*,*)   weight     ! Ū�J�魫
	
  if ( weight > height-100 ) then 
    ! �p�G�魫�j�󨭰���h100, �|����U�����{��
    write(*,*) "Too fat!"
  else
    ! �p�G�魫���j�󨭰���h100, �|����U�����{��
    write(*,*) "Under control."
  end if

stop
end