MODULE mmtsun

  INTEGER :: mm0la(378), mm0lo(378), mm1la(206), mm1lo(206), mm2la(41), &
    mm2lo(41), mm3la(54), mm3lo(54), mm4la(60), mm4lo(60), mm5la(1540), &
    mm5lo(1540), mm6la(80), mm6lo(80), mm7la(144), mm7lo(144), mm8la(245), &
    mm8lo(245), mm9la(285), mm9lo(285)

END MODULE mmtsun
MODULE tsunam

  REAL :: reg0la(378), reg0lo(378), reg1la(206), reg1lo(206), reg2la(41), &
    reg2lo(41), reg3la(54), reg3lo(54), reg4la(60), reg4lo(60), reg5la(1540), &
    reg5lo(1540), reg6la(80), reg6lo(80), reg7la(144), reg7lo(144), &
    reg8la(245), reg8lo(245), reg9la(285), reg9lo(285)

END MODULE tsunam
PROGRAM map01
! .. Local Scalars ..
  REAL :: lat, long
  INTEGER :: icol, iproj, ires, kolor, nr, nreg
  LOGICAL :: screen, trial
! ..
! .. External Subroutines ..
  EXTERNAL convrt, datain, gclose, gopen, groute, gsegcr, gsurfe, plotem, &
    wcentr, wdefc, wextnd, wopen, wplot, wproj, wred1, wred2, wred3, wred4
! ..
  screen = .FALSE.
  trial = .FALSE.
  CALL datain(trial)
  PRINT *, ' What resolution map do you want'
  PRINT *
  PRINT *, ' 1 = 119,650'
  PRINT *, ' 2 =  75,500'
  PRINT *, ' 3 =  43,100'
  PRINT *, ' 4 =  19,300'
  PRINT *, ' 5 =   4,420'
  PRINT *
100 READ (unit=*,fmt=*,end=200,err=200) ires
200 IF ((ires<1) .OR. (ires>5)) THEN
    PRINT *, ' Please input a number in the range 1 to 5'
    GO TO 100
  END IF
  PRINT *, ' What projection would you like?'
  PRINT *
  PRINT *, ' 1 = Lambert       - equal area        -  rectangle'
  PRINT *, ' 2 = Mercator      - equal direction   -  rectangle'
  PRINT *, ' 3 = Hammer        - equal area        -  oval'
  PRINT *, ' 4 = Bonne         -                   -  heart'
  PRINT *, ' 5 = Orthographic  - globe             -  round'
300 READ (unit=*,fmt=*,end=400,err=400) iproj
400 IF ((iproj<1) .OR. (iproj>5)) THEN
    PRINT *, ' Please input a number in the range 1 to 5'
    GO TO 300
  END IF
  lat = 0.0
  long = 180.0
  PRINT *, ' Which region do you wish to plot?'
  PRINT *, ' 0 = all regions'
  PRINT *, ' 1 = Hawaii'
  PRINT *, ' 2 = New Zealand and South Pacific Islands'
  PRINT *, ' 3 = Papua New Guinea and Solomon Islands'
  PRINT *, ' 4 = Indonesia'
  PRINT *, ' 5 = Philippines'
  PRINT *, ' 6 = Japan'
  PRINT *, ' 7 = Kuril Islands and Kamchatka'
  PRINT *, ' 8 = Alaska incluing Aleutian Islands'
  PRINT *, ' 9 = West Coast - North and Central America'
  PRINT *, ' 10 = West Coast - South America'
  READ (unit=*,fmt=*,end=8000,err=8000) nreg
8000 IF ((nreg<0) .OR. (nreg>10)) THEN
    PRINT *, ' Please input a number between 0 and 10 inclusive'
    GO TO 8000
  END IF
  PRINT *, ' Which colour table do you wish to use'
  PRINT *, ' HLS = 1'
  PRINT *, ' CMY = 2'
  PRINT *, ' RGB = 3'
500 READ (unit=*,fmt=*,end=600,err=600) icol
600 IF ((icol<1) .OR. (icol>3)) THEN
    PRINT *, ' Please input a number in the range 1 to 3'
    GO TO 500
  END IF
  PRINT *, ' Select device, a list of valid devices maybe'
  PRINT *, ' obtained by typing'
  PRINT *, ' list *'
  PRINT *, ' at the GROUTE prompt'
  CALL groute(' ')
  CALL gopen
  CALL gsegcr(1)
  CALL gsurfe
  IF (ires==1) THEN
    CALL wextnd
  ELSE IF (ires==2) THEN
    CALL wred1
  ELSE IF (ires==3) THEN
    CALL wred2
  ELSE IF (ires==4) THEN
    CALL wred3
  ELSE IF (ires==5) THEN
    CALL wred4
  END IF
  nr = 7
  kolor = 0
  CALL wopen(0,nr)
  CALL wproj(iproj)
  CALL wcentr(long,lat)
  CALL wdefc(kolor)
  CALL wplot('    ',0.0)
  CALL convrt(trial)
  CALL plotem(trial,nreg)
  CALL gsegcr(1)
  CALL gclose

END PROGRAM map01

SUBROUTINE datain(trial)

  USE tsunam , ONLY : reg0la, reg0lo, reg1la, reg1lo, reg2la, reg2lo, reg3la, &
    reg3lo, reg4la, reg4lo, reg5la, reg5lo, reg6la, reg6lo, reg7la, reg7lo, &
    reg8la, reg8lo, reg9la, reg9lo
! .. Scalar Arguments ..
  LOGICAL :: trial
! ..
! .. Local Scalars ..
  REAL :: dummy
  INTEGER :: i
  CHARACTER (80) :: filnam
! ..
! .. Arrays in Common ..
! ..
! .. Common Blocks ..
! ..
  IF (trial) THEN
    PRINT *, ' Entering data input phase'
  END IF
  filnam = 'tsunami.dat'
  OPEN (unit=50,file=filnam,err=30,status='OLD')
  GO TO 40
30 PRINT *, ' Error opening data file'
  PRINT *, ' Program terminates'
  STOP
40 DO 100 i = 1, 378
100 READ (unit=50,fmt=1000) reg0la(i), reg0lo(i)
1000 FORMAT (1X,F7.2,2X,F7.2)
  DO 110 i = 1, 206
110 READ (unit=50,fmt=1000) reg1la(i), reg1lo(i)
  DO 120 i = 1, 41
120 READ (unit=50,fmt=1000) reg2la(i), reg2lo(i)
  DO 130 i = 1, 54
130 READ (unit=50,fmt=1000) reg3la(i), reg3lo(i)
  DO 140 i = 1, 60
140 READ (unit=50,fmt=1000) reg4la(i), reg4lo(i)
  DO 150 i = 1, 1540
150 READ (unit=50,fmt=1000) reg5la(i), reg5lo(i)
  DO 160 i = 1, 80
160 READ (unit=50,fmt=1000) reg6la(i), reg6lo(i)
  DO 170 i = 1, 144
170 READ (unit=50,fmt=1000) reg7la(i), reg7lo(i)
  DO 180 i = 1, 245
180 READ (unit=50,fmt=1000) reg8la(i), reg8lo(i)
  DO 190 i = 1, 285
190 READ (unit=50,fmt=1000) reg9la(i), reg9lo(i)
  IF (trial) THEN
    DO 200 i = 1, 10
200 PRINT *, reg0la(i), '   ', reg0lo(i)
    PRINT *, ' Exiting data input phase'
    READ *, dummy
  END IF

END SUBROUTINE datain

SUBROUTINE convrt(trial)

  USE tsunam, ONLY : reg0la, reg0lo, reg1la, reg1lo, reg2la, reg2lo, reg3la, &
    reg3lo, reg4la, reg4lo, reg5la, reg5lo, reg6la, reg6lo, reg7la, reg7lo, &
    reg8la, reg8lo, reg9la, reg9lo
  USE mmtsun, ONLY : mm0la, mm0lo, mm1la, mm1lo, mm2la, mm2lo, mm3la, mm3lo, &
    mm4la, mm4lo, mm5la, mm5lo, mm6la, mm6lo, mm7la, mm7lo, mm8la, mm8lo, &
    mm9la, mm9lo
! .. Scalar Arguments ..
  LOGICAL :: trial
! ..
! .. Local Scalars ..
  INTEGER :: i
! ..
! .. External Subroutines ..
  EXTERNAL wgetmm
! ..
! .. Arrays in Common ..
! ..
! .. Common Blocks ..
! ..
  IF (trial) THEN
    PRINT *, ' Entering convert'
  END IF
  DO 100 i = 1, 378
100 CALL wgetmm(reg0lo(i),reg0la(i),mm0lo(i),mm0la(i))
  DO 110 i = 1, 206
110 CALL wgetmm(reg1lo(i),reg1la(i),mm1lo(i),mm1la(i))
  DO 120 i = 1, 41
120 CALL wgetmm(reg2lo(i),reg2la(i),mm2lo(i),mm2la(i))
  DO 130 i = 1, 54
130 CALL wgetmm(reg3lo(i),reg3la(i),mm3lo(i),mm3la(i))
  DO 140 i = 1, 60
140 CALL wgetmm(reg4lo(i),reg4la(i),mm4lo(i),mm4la(i))
  DO 150 i = 1, 1540
150 CALL wgetmm(reg5lo(i),reg5la(i),mm5lo(i),mm5la(i))
  DO 160 i = 1, 80
160 CALL wgetmm(reg6lo(i),reg6la(i),mm6lo(i),mm6la(i))
  DO 170 i = 1, 144
170 CALL wgetmm(reg7lo(i),reg7la(i),mm7lo(i),mm7la(i))
  DO 180 i = 1, 245
180 CALL wgetmm(reg8lo(i),reg8la(i),mm8lo(i),mm8la(i))
  DO 190 i = 1, 285
190 CALL wgetmm(reg9lo(i),reg9la(i),mm9lo(i),mm9la(i))
  IF (trial) THEN
    PRINT *, ' Exiting convert'
  END IF

END SUBROUTINE convrt

SUBROUTINE plotem(trial,nreg)

  USE mmtsun, ONLY : mm0la, mm0lo, mm1la, mm1lo, mm2la, mm2lo, mm3la, mm3lo, &
    mm4la, mm4lo, mm5la, mm5lo, mm6la, mm6lo, mm7la, mm7lo, mm8la, mm8lo, &
    mm9la, mm9lo
! .. Scalar Arguments ..
  INTEGER :: nreg
  LOGICAL :: trial
! ..
! .. Local Scalars ..
  REAL :: dwidth
  INTEGER :: kolour
! ..
! .. External Subroutines ..
  EXTERNAL gdot, gwicol
! ..
! .. Arrays in Common ..
! ..
! .. Common Blocks ..
! ..
! .. Data Statements ..
  DATA dwidth/1.0/
! ..
  IF (trial) THEN
    dwidth = 5.0
    PRINT *, ' Entering Plot points'
  END IF
  IF (nreg==0) THEN
    kolour = 2
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm0lo,mm0la,378)
    kolour = 3
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm1lo,mm1la,206)
    kolour = 4
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm2lo,mm2la,41)
    kolour = 5
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm3lo,mm3la,54)
    kolour = 6
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm4lo,mm4la,60)
    kolour = 7
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm5lo,mm5la,1540)
    kolour = 0
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm6lo,mm6la,80)
    kolour = 24
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm7lo,mm7la,144)
    kolour = 23
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm8lo,mm8la,245)
    kolour = 22
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm9lo,mm9la,285)
  ELSE IF (nreg==1) THEN
    kolour = 0
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm0lo,mm0la,378)
  ELSE IF (nreg==2) THEN
    kolour = 2
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm1lo,mm1la,206)
  ELSE IF (nreg==3) THEN
    kolour = 12
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm2lo,mm2la,41)
  ELSE IF (nreg==4) THEN
    kolour = 4
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm3lo,mm3la,54)
  ELSE IF (nreg==5) THEN
    kolour = 5
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm4lo,mm4la,60)
  ELSE IF (nreg==6) THEN
    kolour = 6
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm5lo,mm5la,1540)
  ELSE IF (nreg==7) THEN
    kolour = 7
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm6lo,mm6la,80)
  ELSE IF (nreg==8) THEN
    kolour = 8
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm7lo,mm7la,144)
  ELSE IF (nreg==9) THEN
    kolour = 9
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm8lo,mm8la,245)
  ELSE IF (nreg==10) THEN
    kolour = 10
    CALL gwicol(dwidth,kolour)
    CALL gdot(mm9lo,mm9la,285)
  END IF
  IF (trial) THEN
    PRINT *, ' Exiting Plot points'
  END IF

END SUBROUTINE plotem


