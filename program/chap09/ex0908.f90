module typedef
  type player
    character(len=80) :: name
    real weight, height
	real score
  end type
end module

program ex0908
  use typedef
  implicit none
  character(len=20)  :: filename = "ex0908dat.txt"
  integer, parameter :: fileid = 20
  logical :: alive   ! �ˬd�ɮ׬O�_�s�b
  type(player) :: p  ! Ū�������
  character(len=10)  :: title ! Ū����ƶ���
  real tempnum       ! Ū�����
  logical, external :: GetNextPlayer ! ��X�U�@��y����ƪ��禡
  integer i          ! �j��O�ƾ�
  integer error      ! �ˬd�ɮ�Ū���O�_���`

  inquire(file=filename, exist=alive)
  if ( .not. alive ) then ! �ɮפ��s�b�N�����{��
    write(*,*) trim(filename)," doesn't exist."
	stop
  end if
  
  open(unit=fileid, file=filename)
  do while(.true.)
    if ( GetNextPlayer(fileid, p%name) ) then
	  do i=1,3
   	    read(fileid, "(A4,1X,F)", iostat=error ) title, tempnum
		if ( error/=0 ) then
		  write(*,*) "�ɮ�Ū�����~"
		  stop
		end if
	    ! �n�g�ѨC�@��̫e����Ӥ���r�ӧP�_Ū�J���O������
	    select case(title)
	    case("����")
	      p%height = tempnum
	    case("�魫")
	      p%weight = tempnum
	    case("�o��")
	      p%score = tempnum
		case default
		  write(*,*) "�X�{�����T�����"
		  stop
        end select
	  end do
	else
	  exit  
	end if

	if ( p%score > 20.0 ) then ! �L�X�o������20���������
	  write(*,"('�m�W:',A8/,'����:',F5.1,' �魫:',F5.1,' �o��:',F4.1)") p
	end if
  end do

  stop
end
! GetNextPlayer�禡�|�q�ɮפ���X�U�@��y������Ʀ�m
! �p�G�ɮפ��٦���ƻݭnŪ��, �Ǧ^.true.
! �p�G�ɮפ��S����ƻݭnŪ��, �Ǧ^.false.
logical function GetNextPlayer(fileid, name)
  implicit none
  integer, intent(in) :: fileid
  character(len=*), intent(out) :: name
  character(len=80) title
  integer  error

  do while(.true.)
    read(fileid,"(A80)",iostat=error) title
	
	if ( error/=0 ) then ! �ɮפ��w�g�S����ƤF
	  GetNextPlayer = .false.
	  return
	end if

	if ( title(1:4)=="�m�W" ) then
	  name = title(6:)
	  GetNextPlayer = .true.
	  return
	end if
  end do

  return
end function