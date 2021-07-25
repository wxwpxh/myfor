module mod_timer

integer,parameter	:: DBL = 4 !selected_real_kind(p=14)

type,public	:: timer 

	private 
	real(DBL)	:: saved_time

! 类绑定过程
contains
	procedure,public :: start_timer => start_timer_sub
	procedure,public :: elapsed_time => elapsed_time_fn

end type timer 

contains 
	subroutine start_timer_sub(this)

		implicit none 
		class(timer)	:: this
		integer			:: value(8)

		call date_and_time(values=value)
		this%saved_time = 60.d0*value(6) + value(7) + 0.001D0 * value(8)

	end subroutine start_timer_sub

	function elapsed_time_fn(this)

		implicit none 
		class(timer)	:: this
		integer			:: value(8)
		real(DBL)		:: current_time,elapsed_time_fn

		call date_and_time(values=value)
		current_time = 60.d0*value(6) + value(7) + 0.001D0 * value(8)
		elapsed_time_fn = current_time - this%saved_time

	end function elapsed_time_fn 

end module 

program main

	use mod_timer

	implicit none 

	type(timer)	:: t

	integer	:: i,j,k 

	call t%start_timer()
	do i=1,10000
		do j=1,10000
			k=i+j
		enddo
	enddo 
	write(*,*) 'time = ',t%elapsed_time()

end program