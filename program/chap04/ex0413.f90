program ex0413
  character(len=20) string 
  string = "Good morning."
  write(*,*) string
  string(6:) = "evening." ! ���]�]�w�q��6�Ӧr�����᪺�r��
  write(*,*) string
end
