program ex0415
  character(len=20) string
  character(len=5) substring
  string = "Have a nice day."
  substring = "nice"
  write(*,*) ichar('A') ! ��X�r��A��ASCII�X
  write(*,*) char(65)   ! ��XASCII�X65�ҥN���r��,�]�N�OA
  write(*,*) len(string) ! ��X�r��string�ŧi�ɪ�����
  write(*,*) len_trim(string) ! ��X�r��string���e������
  write(*,*) index(string, substring) ! nice�bHave a nice day����8�Ӧ�m
end
