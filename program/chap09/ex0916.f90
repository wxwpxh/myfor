program ex0916
  implicit none
  integer i
  integer, external :: GetInteger
  i = GetInteger()
  write(*,*) i
  stop
end program

integer function GetInteger()
  implicit none
  character(len=80) :: string
  logical :: invalid
  integer i, code

  invalid = .true.
  do while( invalid )
    write(*,*) "�п�J�����"
    read(*, "(A80)" ) string
    invalid = .false.
    do i=1, len_trim(string)
	  ! �ˬd��J���r���O�_�]�t'0'��'9'�H�~���r��
      code = ichar(string(i:i))
      if ( code<ichar('0') .or. code>ichar('9') ) then 
	    invalid=.true.
		exit
	  end if 
    end do
  end do

  read( string, * ) GetInteger
  return
end function