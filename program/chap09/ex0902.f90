program ex0902
  implicit none
  character(len=20) :: string

  open(unit=10, file="d:\fortran source\jifen1\test.txt")
  write(10,"(A20)") "Good morning." ! �g���ɮפ�
  rewind(10)
  read(10,"(A20)") string ! �q�ɮפ�Ū�X��
  write(*,"(A20)") string ! �g��ù��W

  stop
end 
