program ex0705
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: matrix(row, col, 3)
  integer m ! �Ψӫ��w�ĴX�ӯx�}
  integer r ! �Ψӫ��wrow
  integer c ! �Ψӫ��wcolumn

  ! Ū�J�x�}�����e
  do m=1, 2
  write(*,"('Matrix ',I1)") m
    do r=1, row
      do c=1, col
        write(*,"('(',I1,',',I1,')=')") r,c
	    read(*,*) matrix(r,c,m)
	  end do
    end do
  end do

  ! ���1,2�ӯx�}�ۥ[
  write(*,*) "Matrix 1 + Matrix 2 = "
  do r=1, row
    do c=1, col
	  matrix(r,c,3) = matrix(r,c,1)+matrix(r,c,2) ! �x�}�ۥ[
	  write(*,"('(',I1,',',I1,')=',I3)") r,c,matrix(r,c,3)
	end do
  end do

  stop
end
