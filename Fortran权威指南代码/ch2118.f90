PROGRAM C2118
INTEGER , POINTER :: A=>NULL(),B=>NULL()
INTEGER , TARGET :: C
INTEGER :: D
  PRINT *,LOC(a)
  PRINT *,LOC(b)
  PRINT *,LOC(c)
  PRINT *,LOC(d)
  C = 1
  A => C
  C = 2
  B => C
  D = A + B
  PRINT *,A,B,C,D
  PRINT *,LOC(a)
  PRINT *,LOC(b)
  PRINT *,LOC(c)
  print *,loc(d)
END PROGRAM C2118


