program sum_of_cubes
! This program prints all 3-digit numbers that
! equal the sum of the cubes of their digits.
implicit none
integer :: H, T, U
do H = 1, 9
	do T = 0, 9
		do U = 0, 9
		 if (100*H + 10*T + U == H**3 + T**3 + U**3) &
		 print "(3I1)", H, T, U
		end do
	end do
end do
end program sum_of_cubes
