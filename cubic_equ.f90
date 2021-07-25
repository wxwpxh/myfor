Module Shengjin_mod
  Implicit None

contains

  Function Cubic_equation(Co) Result (X)
!盛金公式求解一元三次方程
!默认浮点为8字节,以保证精度
    Integer , Parameter :: P = Selected_Real_Kind(12)
    Real (Kind=P), Parameter :: Eps = 1.0_P
    Real (Kind=P), Intent (In) :: Co(4)
    Real (Kind=P) :: A, B, C, D, A0, B0, C0, D0, Y1, Y2
    Complex (Kind=P) :: X(3)
    A = Co(1)
    B = Co(2)
    C = Co(3)
    D = Co(4)
    X = Huge(A)/100.0_P
!非三次方程
    If (Abs(A) < Eps) Return
    A0 = B*B - 3.0_P*A*C
    B0 = B*C - 9.0_P*A*D
    C0 = C*C - 3.0_P*B*D
    D0 = B0*B0 - 4.0_P*A0*C0

    If (Abs(A0) < Eps .And. Abs(B0) < Eps) Then
!三重实根
      X(1:3) = -B/(3.0_P*A)
    Else
      If (D0 > 0.0_P) Then
        Y1 = (A0*B+1.5_P*A*(-B0+Sqrt(D0)))
        If (Y1 < 0.0_P) Then
          Y1 = -Abs(Y1)**(1.0_P/3.0_P)
        Else
          Y1 = Y1**(1.0_P/3.0_P)
        End If
        Y2 = (A0*B+1.5_P*A*(-B0-Sqrt(D0)))
        If (Y2 < 0.0_P) Then
          Y2 = -Abs(Y2)**(1.0_P/3.0_P)
        Else
          Y2 = Y2**(1.0_P/3.0_P)
        End If
!一个实根，一对共轭复根
        X(1) = -(B+Y1+Y2)/(3.0_P*A)
        X(2) = Cmplx(-2.0_P*B+Y1+Y2, Sqrt(3.0_P)*(Y1-Y2))/(6.0_P*A)
        X(3) = Conjg(X(2))
      Else If (D0 < 0.0_P) Then
        Y1 = (2.0_P*A0*B-3.0_P*A*B0)/(2.0_P*A0**1.5_P)
        Y2 = Acos(Y1)/3.0_P
!三个不同实根
        X(1) = (-B-2.0_P*Sqrt(A0)*Cos(Y2))/(3.0_P*A)
        X(2) = (-B+Sqrt(A0)*(Cos(Y2)+Sqrt(3.0_P)*Sin(Y2)))/(3.0_P*A)
        X(3) = (-B+Sqrt(A0)*(Cos(Y2)-Sqrt(3.0_P)*Sin(Y2)))/(3.0_P*A)
      Else
!三个实根，其中两个相等
        X(1) = B0/A0 - B/A
        X(2:3) = -0.5_P*B0/A0
      End If
    End If
  End Function Cubic_equation
End Module Shengjin_mod

Program www_fcode_cn
  Use Shengjin_mod
  Implicit None
  Real (Kind=8) :: A(4), Emax
  Complex (Kind=8) :: X(3), E(3)
  A = (/ 3568.D0, 458.D0, 47.D0, -20.D0 /)
  X = Cubic_equation(A)
  E = A(1)*X*X*X + A(2)*X*X + A(3)*X + A(4)
  Emax = Maxval(Abs(E))
  Write (*, '(6f15.7)') Real(X(1)), Aimag(X(1)), Real(X(2)), Aimag(X(2)), Real(X(3)), Aimag(X(3))
  ! 0.1250000   0.0000000   -0.1266816  0.1696904  -0.1266816  -0.1696904
  Write (*, *) '最大误差：', Emax
  ! 4.733964436118326E-008
  Read (*, *)
End Program www_fcode_cn
