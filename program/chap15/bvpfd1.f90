! IMSL BVPFD�ܽd
! �D��y'''-y''+y'-y=0
! �g�Ly'=y, y2=y', y3=y''�N����|�ܦ�First order ODE
! y1'=y2
! y2'=y3
! y3'=y3-y2+y1
! ���׬�y1=cos(t), y2=-sin(t), y3=-cos(t)
program main
  use IMSL
  implicit none
  integer, parameter :: MXGRID=45, NEQNS=3, NINIT=10, &
                        LDYFIN=NEQNS, LDYINI=NEQNS, NLEFT = 1, NCUPBC = 1
  INTEGER I, J, NFINAL
  real, parameter :: PI = 3.14159
  real, parameter :: TOL=1E-3, TLEFT=0.0, TRIGHT=2*PI, PISTEP=0.0
  real ERREST(NEQNS), TFINAL(MXGRID), TINIT(NINIT),& 
       YFINAL(LDYFIN,MXGRID), YINIT(LDYINI,NINIT)
  real ERROR(NEQNS, NINIT)
  logical, parameter :: LINEAR=.true., PRINT=.false.
  external FCNBC, FCNEQN, FCNJAC

  ! �w�q�ҭn�p�⪺T�Ȧ�m
  DO I=1, NINIT
    TINIT(I) = TLEFT + (I-1)*(TRIGHT-TLEFT)/FLOAT(NINIT-1)
  end do
  YINIT = 0
  ! �D��
  call BVPFD (FCNEQN, FCNJAC, FCNBC, FCNEQN, FCNBC, NEQNS, NLEFT,& 
              NCUPBC, TLEFT, TRIGHT, PISTEP, TOL, NINIT, TINIT,& 
              YINIT, LDYINI, LINEAR, PRINT, MXGRID, NFINAL,& 
              TFINAL, YFINAL, LDYFIN, ERREST)
  ! ��X���G
  write(*,"(14X,'T', 6X,'Y1=COS(t)', 5X,'Y2=-SIN(t)', 5X,'Y3=-COS(t)')")
  write(*,"(4F15.6)") (TFINAL(I),(YFINAL(J,I),J=1,NEQNS),I=1, NFINAL)

  stop
end program
!
! �p�ⰾ�L����{
!
subroutine FCNEQN(NEQNS, T, Y, P, DYDX)
  implicit none
  integer NEQNS
  real T, P, Y(NEQNS), DYDX(NEQNS)
  ! y1' = y2
  DYDX(1) = Y(2)
  ! y2' = y3
  DYDX(2) = Y(3)
  ! y3' = y3 - y2 + y1
  DYDX(3) = Y(3) - Y(2) + Y(1)
  return
end subroutine
!
! DYPDY(i,j) = dFi/dYj
!
subroutine FCNJAC(NEQNS, T, Y, P, DYPDY)
  implicit none
  integer NEQNS
  real T, P, Y(NEQNS), DYPDY(NEQNS,NEQNS)
  ! y1' = 0*y1 + 1*y2 + 0*y3
  DYPDY(1,1) = 0.0
  DYPDY(1,2) = 1.0
  DYPDY(1,3) = 0.0
  ! y2' = 0*y1 + 0*y2 + 1*y3
  DYPDY(2,1) = 0.0
  DYPDY(2,2) = 0.0
  DYPDY(2,3) = 1.0
  ! y3' = 1*y1 - 1*y2 + 1*y3
  DYPDY(3,1) = 1.0
  DYPDY(3,2) =-1.0
  DYPDY(3,3) = 1.0
  return
end subroutine
! �w�q��ɱ���
! F(1), F(2)....F(n)���ȳ����ӵ���0
! 
subroutine FCNBC(NEQNS, YLEFT, YRIGHT, P, F)
  implicit none
  integer NEQNS
  real P, YLEFT(NEQNS), YRIGHT(NEQNS), F(NEQNS)
  ! Define boundary conditions
  F(1) = YLEFT(1) - 1.0 ! �n���ϥΥ��䪺��ɭ�
  F(2) = YLEFT(2) - YRIGHT(2) ! �A�ӭn�ϥΥ��k���䪺��ɭ�
  F(3) = YRIGHT(2)      ! �̫�~�ϥΥk�䪺��ɭ�
  return
end subroutine