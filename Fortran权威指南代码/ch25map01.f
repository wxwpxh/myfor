      PROGRAM Map01
      LOGICAL TRIAL,SCREEN
      REAL LONG,LAT
      SCREEN = .FALSE.
      TRIAL = .FALSE.
      CALL DATAIN(TRIAL)
      PRINT *,' What resolution map do you want'
      PRINT *
      PRINT *,' 1 = 119,650'
      PRINT *,' 2 =  75,500'
      PRINT *,' 3 =  43,100'
      PRINT *,' 4 =  19,300'
      PRINT *,' 5 =   4,420'
      PRINT *
  100 READ (UNIT=*,FMT=*,END=200,ERR=200) IRES
  200 IF ((IRES.LT.1) .OR. (IRES.GT.5)) THEN
          PRINT *,' Please input a number in the range 1 to 5'
          GO TO 100
      END IF
      PRINT *,' What projection would you like?'
      PRINT *
      PRINT *,' 1 = Lambert       - equal area        -  rectangle'
      PRINT *,' 2 = Mercator      - equal direction   -  rectangle'
      PRINT *,' 3 = Hammer        - equal area        -  oval'
      PRINT *,' 4 = Bonne         -                   -  heart'
      PRINT *,' 5 = Orthographic  - globe             -  round'
  300 READ (UNIT=*,FMT=*,END=400,ERR=400) IPROJ
  400 IF ((IPROJ.LT.1) .OR. (IPROJ.GT.5)) THEN
          PRINT *,' Please input a number in the range 1 to 5'
          GO TO 300
      END IF
      LAT = 0.0
      LONG = 180.0
      PRINT *,' Which region do you wish to plot?'
      PRINT *,' 0 = all regions'
      PRINT *,' 1 = Hawaii'
      PRINT *,' 2 = New Zealand and South Pacific Islands'
      PRINT *,' 3 = Papua New Guinea and Solomon Islands'
      PRINT *,' 4 = Indonesia'
      PRINT *,' 5 = Philippines'
      PRINT *,' 6 = Japan'
      PRINT *,' 7 = Kuril Islands and Kamchatka'
      PRINT *,' 8 = Alaska incluing Aleutian Islands'
      PRINT *,' 9 = West Coast - North and Central America'
      PRINT *,' 10 = West Coast - South America'
      READ (UNIT=*,FMT=*,END=8000,ERR=8000) NREG
 8000 IF ((NREG.LT.0) .OR. (NREG.GT.10)) THEN
          PRINT *,' Please input a number between 0 and 10 inclusive'
          GO TO 8000
      END IF
      PRINT *,' Which colour table do you wish to use'
      PRINT *,' HLS = 1'
      PRINT *,' CMY = 2'
      PRINT *,' RGB = 3'
  500 READ (UNIT=*,FMT=*,END=600,ERR=600) ICOL
  600 IF ((ICOL.LT.1) .OR. (ICOL.GT.3)) THEN
          PRINT *,' Please input a number in the range 1 to 3'
          GO TO 500
      END IF
      PRINT *,' Select device, a list of valid devices maybe'
      PRINT *,' obtained by typing'
      PRINT *,' list *'
      PRINT *,' at the GROUTE prompt'
      CALL GROUTE(' ')
      CALL GOPEN
      CALL GSEGCR(1)
      CALL GSURFE
      IF (IRES.EQ.1) THEN
          CALL WEXTND
      ELSE IF (IRES.EQ.2) THEN
          CALL WRED1
      ELSE IF (IRES.EQ.3) THEN
          CALL WRED2
      ELSE IF (IRES.EQ.4) THEN
          CALL WRED3
      ELSE IF (IRES.EQ.5) THEN
          CALL WRED4
      END IF
      NR = 7
      KOLOR = 0
      CALL WOPEN(0,NR)
      CALL WPROJ(IPROJ)
      CALL WCENTR(LONG,LAT)
      CALL WDEFC(KOLOR)
      CALL WPLOT('    ',0.0)
      CALL CONVRT(TRIAL)
      CALL PLOTEM(TRIAL,NREG)
      CALL GSEGCR(1)
      CALL GCLOSE
      END
      SUBROUTINE DATAIN(TRIAL)
      LOGICAL TRIAL
      CHARACTER*80 FILNAM
      COMMON /TSUNAM/REG0LA(378),REG0LO(378),REG1LA(206),REG1LO(206),
     +       REG2LA(41),REG2LO(41),REG3LA(54),REG3LO(54),REG4LA(60),
     +       REG4LO(60),REG5LA(1540),REG5LO(1540),REG6LA(80),REG6LO(80),
     +       REG7LA(144),REG7LO(144),REG8LA(245),REG8LO(245),
     +       REG9LA(285),REG9LO(285)

      IF (TRIAL.EQ..TRUE.) THEN
          PRINT *,' Entering data input phase'
      END IF
      FILNAM = 'tsunami.dat'
      OPEN (UNIT=50,FILE=FILNAM,ERR=30,STATUS='OLD')
      GO TO 40
   30 PRINT *,' Error opening data file'
      PRINT *,' Program terminates'
      STOP
   40 DO 100 I = 1,378
  100 READ (UNIT=50,FMT=1000) REG0LA(I),REG0LO(I)
 1000 FORMAT (1X,F7.2,2X,F7.2)
      DO 110 I = 1,206
  110 READ (UNIT=50,FMT=1000) REG1LA(I),REG1LO(I)
      DO 120 I = 1,41
  120 READ (UNIT=50,FMT=1000) REG2LA(I),REG2LO(I)
      DO 130 I = 1,54
  130 READ (UNIT=50,FMT=1000) REG3LA(I),REG3LO(I)
      DO 140 I = 1,60
  140 READ (UNIT=50,FMT=1000) REG4LA(I),REG4LO(I)
      DO 150 I = 1,1540
  150 READ (UNIT=50,FMT=1000) REG5LA(I),REG5LO(I)
      DO 160 I = 1,80
  160 READ (UNIT=50,FMT=1000) REG6LA(I),REG6LO(I)
      DO 170 I = 1,144
  170 READ (UNIT=50,FMT=1000) REG7LA(I),REG7LO(I)
      DO 180 I = 1,245
  180 READ (UNIT=50,FMT=1000) REG8LA(I),REG8LO(I)
      DO 190 I = 1,285
  190 READ (UNIT=50,FMT=1000) REG9LA(I),REG9LO(I)
      IF (TRIAL.EQ..TRUE.) THEN
          DO 200 I = 1,10
  200     PRINT *,REG0LA(I),'   ',REG0LO(I)
          PRINT *,' Exiting data input phase'
          READ *,DUMMY
      END IF
      END
      SUBROUTINE CONVRT(TRIAL)
      LOGICAL TRIAL
      COMMON /TSUNAM/REG0LA(378),REG0LO(378),REG1LA(206),REG1LO(206),
     +       REG2LA(41),REG2LO(41),REG3LA(54),REG3LO(54),REG4LA(60),
     +       REG4LO(60),REG5LA(1540),REG5LO(1540),REG6LA(80),REG6LO(80),
     +       REG7LA(144),REG7LO(144),REG8LA(245),REG8LO(245),
     +       REG9LA(285),REG9LO(285)
      COMMON /MMTSUN/MM0LA(378),MM0LO(378),MM1LA(206),MM1LO(206),
     +       MM2LA(41),MM2LO(41),MM3LA(54),MM3LO(54),MM4LA(60),
     +       MM4LO(60),MM5LA(1540),MM5LO(1540),MM6LA(80),MM6LO(80),
     +       MM7LA(144),MM7LO(144),MM8LA(245),MM8LO(245),MM9LA(285),
     +       MM9LO(285)

      IF (TRIAL.EQ..TRUE.) THEN
          PRINT *,' Entering convert'
      END IF
      DO 100 I = 1,378
  100 CALL WGETMM(REG0LO(I),REG0LA(I),MM0LO(I),MM0LA(I))
      DO 110 I = 1,206
  110 CALL WGETMM(REG1LO(I),REG1LA(I),MM1LO(I),MM1LA(I))
      DO 120 I = 1,41
  120 CALL WGETMM(REG2LO(I),REG2LA(I),MM2LO(I),MM2LA(I))
      DO 130 I = 1,54
  130 CALL WGETMM(REG3LO(I),REG3LA(I),MM3LO(I),MM3LA(I))
      DO 140 I = 1,60
  140 CALL WGETMM(REG4LO(I),REG4LA(I),MM4LO(I),MM4LA(I))
      DO 150 I = 1,1540
  150 CALL WGETMM(REG5LO(I),REG5LA(I),MM5LO(I),MM5LA(I))
      DO 160 I = 1,80
  160 CALL WGETMM(REG6LO(I),REG6LA(I),MM6LO(I),MM6LA(I))
      DO 170 I = 1,144
  170 CALL WGETMM(REG7LO(I),REG7LA(I),MM7LO(I),MM7LA(I))
      DO 180 I = 1,245
  180 CALL WGETMM(REG8LO(I),REG8LA(I),MM8LO(I),MM8LA(I))
      DO 190 I = 1,285
  190 CALL WGETMM(REG9LO(I),REG9LA(I),MM9LO(I),MM9LA(I))
      IF (TRIAL.EQ..TRUE.) THEN
          PRINT *,' Exiting convert'
      END IF
      END

      SUBROUTINE PLOTEM(TRIAL,NREG)
      LOGICAL TRIAL
      INTEGER NREG
      COMMON /MMTSUN/MM0LA(378),MM0LO(378),MM1LA(206),MM1LO(206),
     +       MM2LA(41),MM2LO(41),MM3LA(54),MM3LO(54),MM4LA(60),
     +       MM4LO(60),MM5LA(1540),MM5LO(1540),MM6LA(80),MM6LO(80),
     +       MM7LA(144),MM7LO(144),MM8LA(245),MM8LO(245),MM9LA(285),
     +       MM9LO(285)
      DATA DWIDTH/1.0/

      IF (TRIAL.EQ..TRUE.) THEN
          DWIDTH = 5.0
          PRINT *,' Entering Plot points'
      END IF
      IF (NREG.EQ.0) THEN
          KOLOUR = 2
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM0LO,MM0LA,378)
          KOLOUR = 3
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM1LO,MM1LA,206)
          KOLOUR = 4
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM2LO,MM2LA,41)
          KOLOUR = 5
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM3LO,MM3LA,54)
          KOLOUR = 6
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM4LO,MM4LA,60)
          KOLOUR = 7
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM5LO,MM5LA,1540)
          KOLOUR = 0
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM6LO,MM6LA,80)
          KOLOUR = 24
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM7LO,MM7LA,144)
          KOLOUR = 23
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM8LO,MM8LA,245)
          KOLOUR = 22
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM9LO,MM9LA,285)
      ELSE IF (NREG.EQ.1) THEN
          KOLOUR = 0
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM0LO,MM0LA,378)
      ELSE IF (NREG.EQ.2) THEN
          KOLOUR = 2
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM1LO,MM1LA,206)
      ELSE IF (NREG.EQ.3) THEN
          KOLOUR = 12
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM2LO,MM2LA,41)
      ELSE IF (NREG.EQ.4) THEN
          KOLOUR = 4
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM3LO,MM3LA,54)
      ELSE IF (NREG.EQ.5) THEN
          KOLOUR = 5
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM4LO,MM4LA,60)
      ELSE IF (NREG.EQ.6) THEN
          KOLOUR = 6
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM5LO,MM5LA,1540)
      ELSE IF (NREG.EQ.7) THEN
          KOLOUR = 7
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM6LO,MM6LA,80)
      ELSE IF (NREG.EQ.8) THEN
          KOLOUR = 8
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM7LO,MM7LA,144)
      ELSE IF (NREG.EQ.9) THEN
          KOLOUR = 9
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM8LO,MM8LA,245)
      ELSE IF (NREG.EQ.10) THEN
          KOLOUR = 10
          CALL GWICOL(DWIDTH,KOLOUR)
          CALL GDOT(MM9LO,MM9LA,285)
      END IF
      IF (TRIAL.EQ..TRUE.) THEN
          PRINT *,' Exiting Plot points'
      END IF
      END

