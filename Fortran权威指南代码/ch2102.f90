PROGRAM C2102
INTEGER , POINTER :: A,B
INTEGER , TARGET :: C
INTEGER :: D
  PRINT *,ASSOCIATED(A)
  PRINT *,ASSOCIATED(B)
  C = 1
  A => C
  C = 2
  B => C
  D = A + B
  PRINT *,A,B,C,D
  PRINT *,ASSOCIATED(A)
  PRINT *,ASSOCIATED(B)
END PROGRAM C2102

