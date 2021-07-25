PROGRAM ch2612

USE DISLIN

  LOGICAL :: trial, screen
  REAL :: long, lat
  screen = .FALSE.
  trial = .FALSE.

  CALL datain(trial)

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
120 READ (unit=*,fmt=*,end=130,err=130) nreg
130 IF ((nreg<0) .OR. (nreg>10)) THEN
    PRINT *, ' Please input a number between 0 and 10 inclusive'
    GO TO 120
  END IF

! dislin initialisation routines
! and setting of some basic components
! of the plot

! These are based on two program examples.

! Choose a file format

  CALL METAFL('PDF')

! da4l = din a4 landscape 2970*2100 points

  CALL SETPAG('DA4L')

! Initialise dislin

  CALL DISINI

! Plot a border round the page

  CALL PAGERA

! Choose font

  CALL PSFONT('HELVETICA')

! argument is the thickness of the frame in plot coordinates.

  CALL FRAME(3)

! determines the position of an axis system.
! the lower left corner of the axis system

  CALL AXSPOS(400,1850)

! The size of the axis system
! are the length and height of an axis system in plot coordinates. The default
! values are set to 2/3 of the page length and height.

  CALL AXSLEN(2400,1400)

! Define axis title

  CALL NAME('Longitude','X')

! Define axis title

  CALL NAME('Latitude','Y')

! This routine plots a title over an axis system.

  CALL TITLIN('Plot of 3034 Tsunami events ',3)

! determines which label types will be plotted on an axis.
! MAP defines geographical labels which are plotted as non negative floating-point
! numbers with the following characters ’W’, ’E’, ’N’ and ’S’.

  CALL LABELS('MAP','XY')

! plots a geographical axis system.

  CALL GRAFMP(-180.,180.,-180.,90.,-90.,90.,-90.,30.)

! The statement CALL GRIDMP (I, J) overlays an axis system with a longitude
! and latitude grid where I and J are the number of grid lines between labels in
! the X- and Y-direction.

  CALL GRIDMP(1,1)

! The routine WORLD plots coastlines and lakes.

  CALL WORLD

! The angle and height of the characters can be changed with the routines AN-GLE
! and HEIGHT.

  CALL HEIGHT(50)

! This routine plots a title over an axis system. The title may contain up to four lines of text 

designated
! with TITLIN.

  CALL TITLE

! This is a call to the convert routine.
! This was required by UNIRAS
!  CALL convrt(trial)

! This is a call to the routine that actually plots each event.

  CALL plotem(trial,nreg)

! DISFIN terminates DISLIN and prints a message on the screen. The level is set back to 0.

  CALL DISFIN


END PROGRAM ch2612

SUBROUTINE datain(trial)

 COMMON /TSUNAM/ &
  reg0la(378) , &
  reg0lo(378) , &
  reg1la(206) , &
  reg1lo(206) , &
  reg2la(41) , &
  reg2lo(41) , &
  reg3la(54) , &
  reg3lo(54) , &
  reg4la(60) , &
  reg4lo(60) , &
  reg5la(1540) , &
  reg5lo(1540) , &
  reg6la(80) , &
  reg6lo(80) , &
  reg7la(144) , &
  reg7lo(144) , &
  reg8la(245) , &
  reg8lo(245) , &
  reg9la(285) , &
  reg9lo(285)

  LOGICAL :: trial
  CHARACTER (80) :: filnam

  IF (trial) THEN
    PRINT *, ' Entering data input phase'
  END IF
  filnam = 'tsunami.dat'
  OPEN (unit=50,file=filnam,err=100,status='OLD')
  GO TO 110
100 PRINT *, ' Error opening data file'
  PRINT *, ' Program terminates'
  STOP
110 DO i = 1, 378
    READ (unit=50,fmt=1000) reg0la(i), reg0lo(i)
  END DO
1000 FORMAT (1X,F7.2,2X,F7.2)
  DO i = 1, 206
    READ (unit=50,fmt=1000) reg1la(i), reg1lo(i)
  END DO
  DO i = 1, 41
    READ (unit=50,fmt=1000) reg2la(i), reg2lo(i)
  END DO
  DO i = 1, 54
    READ (unit=50,fmt=1000) reg3la(i), reg3lo(i)
  END DO
  DO i = 1, 60
    READ (unit=50,fmt=1000) reg4la(i), reg4lo(i)
  END DO
  DO i = 1, 1540
    READ (unit=50,fmt=1000) reg5la(i), reg5lo(i)
  END DO
  DO i = 1, 80
    READ (unit=50,fmt=1000) reg6la(i), reg6lo(i)
  END DO
  DO i = 1, 144
    READ (unit=50,fmt=1000) reg7la(i), reg7lo(i)
  END DO
  DO i = 1, 245
    READ (unit=50,fmt=1000) reg8la(i), reg8lo(i)
  END DO
  DO i = 1, 285
    READ (unit=50,fmt=1000) reg9la(i), reg9lo(i)
  END DO
  IF (trial) THEN
    DO i = 1, 10
      PRINT *, reg0la(i), '   ', reg0lo(i)
    END DO
    PRINT *, ' Exiting data input phase'
    READ *, dummy
  END IF

END SUBROUTINE datain

SUBROUTINE plotem(trial,nreg)

USE DISLIN

 COMMON /TSUNAM/ &
  reg0la(378) , &
  reg0lo(378) , &
  reg1la(206) , &
  reg1lo(206) , &
  reg2la(41) , &
  reg2lo(41) , &
  reg3la(54) , &
  reg3lo(54) , &
  reg4la(60) , &
  reg4lo(60) , &
  reg5la(1540) , &
  reg5lo(1540) , &
  reg6la(80) , &
  reg6lo(80) , &
  reg7la(144) , &
  reg7lo(144) , &
  reg8la(245) , &
  reg8lo(245) , &
  reg9la(285) , &
  reg9lo(285)

  LOGICAL :: trial
  INTEGER :: nreg
  INTEGER :: kolour=10
  DATA dwidth/1.0/

  IF (trial) THEN
    dwidth = 5.0
    PRINT *, ' Entering Plot points'
  END IF

  CALL INCMRK(-1)

  IF (nreg==0) THEN
    CALL SETCLR(kolour)
    CALL CURVMP(reg0lo,reg0la,378)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg1lo,reg1la,206)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg2lo,reg2la,41)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg3lo,reg3la,54)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg4lo,reg4la,60)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg5lo,reg5la,1540)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg6lo,reg6la,80)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg7lo,reg7la,144)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg8lo,reg8la,245)
    kolour = kolour +30
    CALL SETCLR(kolour)
    CALL CURVMP(reg9lo,reg9la,285)
  ELSE IF (nreg==1) THEN
    kolour = 10
    CALL SETCLR(kolour)
    CALL CURVMP(reg0lo,reg0la,378)
  ELSE IF (nreg==2) THEN
    kolour = 20
    CALL SETCLR(kolour)
    CALL CURVMP(reg1lo,reg1la,206)
  ELSE IF (nreg==3) THEN
    kolour = 30
    CALL SETCLR(kolour)
    CALL CURVMP(reg2lo,reg2la,41)
  ELSE IF (nreg==4) THEN
    kolour = 40
    CALL SETCLR(kolour)
    CALL CURVMP(reg3lo,reg3la,54)
  ELSE IF (nreg==5) THEN
    kolour = 50
    CALL SETCLR(kolour)
    CALL CURVMP(reg4lo,reg4la,60)
  ELSE IF (nreg==6) THEN
    kolour = 60
    CALL SETCLR(kolour)
    CALL CURVMP(reg5lo,reg5la,1540)
  ELSE IF (nreg==7) THEN
    kolour = 70
    CALL SETCLR(kolour)
    CALL CURVMP(reg6lo,reg6la,80)
  ELSE IF (nreg==8) THEN
    kolour = 80
    CALL SETCLR(kolour)
    CALL CURVMP(reg7lo,reg7la,144)
  ELSE IF (nreg==9) THEN
    kolour = 90
    CALL SETCLR(kolour)
    CALL CURVMP(reg8lo,reg8la,245)
  ELSE IF (nreg==10) THEN
    kolour = 100
    CALL SETCLR(kolour)
    CALL CURVMP(reg9lo,reg9la,285)
  END IF
  IF (trial) THEN
    PRINT *, ' Exiting Plot points'
  END IF

END SUBROUTINE plotem
