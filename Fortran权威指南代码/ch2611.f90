MODULE date_module
!  Collected and put together january 1972,
!  h. d. knoble.
!  Original references are cited in each routine.
!  Code converted using to_f90 by alan miller
!  Date: 1999-12-22  time: 10:23:47
!  Compatible with imagine1 f compiler: 2002-07-19
!  At this time the functions and
!  subroutines were as described below
!  FUNCTION iday(yyyy, mm, dd) RESULT(ival)
!  FUNCTION izlr(yyyy, mm, dd) RESULT(ival)
!  SUBROUTINE calend(yyyy, ddd, mm, dd) 
!  SUBROUTINE cdate(jd, yyyy, mm, dd)
!  SUBROUTINE daysub(jd, yyyy, mm, dd, wd, ddd)
!  FUNCTION jd(yyyy, mm, dd) RESULT(ival)
!  FUNCTION ndays(mm1, dd1, yyyy1, 
!     mm2, dd2, yyyy2) RESULT(ival)
!  SUBROUTINE date_stamp( string, want_day, short )
!  Code converted by ian chivers and jane sleightholme
!  November 2004 - May 2005
!  The changes are to go from 
!  working with integer variables
!  for year, day and month to 
!  user defined date variables.
! .. Implicit None Statement ..
  IMPLICIT NONE
! ..
! .. Default Accessibility ..
  PRIVATE
! ..
! .. Derived Type Declarations ..
  TYPE, PUBLIC :: date
    PRIVATE
    INTEGER :: day
    INTEGER :: month
    INTEGER :: year
  END TYPE date
! ..
! .. Public Statements ..
  PUBLIC :: calendar_to_julian,& 
    date_, &
    date_stamp, & 
    date_to_day_in_year, &
    date_to_weekday_number, &
    get_day, &
    get_month, &
    get_year, &
    julian_to_date, &
    julian_to_date_and_week_and_day, &
    ndays, &
    year_and_day_to_date
! ..
!  The above are the contained 
!  functions and subroutines
!  in this module.
!  Here is a short description of each one
!    date_to_day_in_year     - function
!      returns the day in the year
!      original arguments of day,month,year
!      now date
!      dayinyear
!    date_to_weekday_number  - function   
!      returns the week day number
!      original argument d,m,y
!      now date
!      weekdaynum
!    year_and_day_to_date    - subroutine
!      returns the day and month from
!      year and day in year
!    julian_to_date          - subroutine 
!      returns a year_and_day_to_datear date from
!      a julian date
!    ndays                   - function
!      returns the number of days between
!      two dates
!    julian_to_date_and_week_and_day   - subroutine
!      given a julian day this routine
!      calculates year, month day and 
!      week day number and day number
!    calendar_to_julian      - function
!      returns julian date from
!      year_and_day_to_datear date
CONTAINS

! arithmetic functions "izlr" and "iday" 
! are taken from remark on
! algorithm 398, by j. douglas robertson, 
! cacm 15(10):918.

  FUNCTION date_to_day_in_year(x)
! Convert from date to day in year
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: date_to_day_in_year
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: x
! ..
! .. Intrinsic Functions ..
    INTRINSIC modulo
! ..
    date_to_day_in_year = 3055*(x%month+2)/100 &
      - (x%month+10)/13*2 - 91 + &
      (1-(modulo(x%year,4)+3)/4 &
      + (modulo(x%year,100)+99)/100 &
      - (modulo(x%year, &
      400)+399)/400)*(x%month+10)/13 + x%day

  END FUNCTION date_to_day_in_year

  FUNCTION date_to_weekday_number(x)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: date_to_weekday_number
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: x
! ..
! .. Intrinsic Functions ..
    INTRINSIC modulo
! ..
    date_to_weekday_number = &
      modulo((13*(x%month+10 &
      -(x%month+10)/13*12)-1)/5+x &
      %day+77+5*(x%year+(x%month-14)/12 &
      -(x%year+(x%month-14)/12)/100*100)/4 &
      +(x%year+(x%month-14)/12)/400 &
      -(x%year+(x%month-14)/12)/100*2,7)

  END FUNCTION date_to_weekday_number

  FUNCTION year_and_day_to_date(year,day) RESULT (x)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    TYPE (date) :: x
! ..
! .. Scalar Arguments ..
    INTEGER, INTENT (IN) :: day, year
! ..
! .. Local Scalars ..
    INTEGER :: t
! ..
! .. Intrinsic Functions ..
    INTRINSIC modulo
! ..
    x%year = year
    t = 0
    IF (modulo(year,4)==0) THEN
      t = 1
    END IF

!------the following statement is 
! necessary IF year is < 1900 or > 2100.

    IF (modulo(year,400)/=0 &
      .AND. modulo(year,100)==0) THEN
      t = 0
    END IF

    x%day = day

    IF (day>59+t) THEN
      x%day = x%day + 2 - t
    END IF

    x%month = ((x%day+91)*100)/3055
    x%day = (x%day+91) - (x%month*3055)/100
    x%month = x%month - 2

    IF (x%month>=1 .AND. x%month<=12) THEN
      RETURN
    END IF

! x%month will be correct 
! iff day is correct for year.

    WRITE (unit=*,fmt='(a,i11,a)') &
    '$$year_and_day_to_date: day of the year input =', &
    day, ' is out of range.'

  END FUNCTION year_and_day_to_date



  FUNCTION julian_to_date(julian) RESULT (x)
! Given a julian day number the date is returned.
! julian is the julian date from an epocch
! in the very distant past.  see cacm 1968 11(10):657,
! letter to the editor by fliegel and van flandern.
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Scalar Arguments ..
    INTEGER, INTENT (IN) :: julian
! ..
! .. Local Scalars ..
    INTEGER :: l, n
! ..
! .. Function Return Value ..
    TYPE (date) :: x
! ..
    l = julian + 68569
    n = 4*l/146097
    l = l - (146097*n+3)/4
    x%year = 4000*(l+1)/1461001
    l = l - 1461*x%year/4 + 31
    x%month = 80*l/2447
    x%day = l - 2447*x%month/80
    l = x%month/11
    x%month = x%month + 2 - 12*l
    x%year = 100*(n-49) + x%year + l

  END FUNCTION julian_to_date


  SUBROUTINE &
  julian_to_date_and_week_and_day(jd,x,wd,ddd)
! given jd, a julian day # (see asf jd), 
! this routine calculates dd,
! the day number of the month; 
! mm, the month number; yyyy the year;
! wd the weekday number, and 
! ddd the day number of the year.
! example:
! CALL julian_to_date_and_week_and_day
! (2440588, yyyy, mm, dd, wd, ddd) 
! yields 1970 1 1 4 1.
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Scalar Arguments ..
    INTEGER, INTENT (OUT) :: ddd, wd
    INTEGER, INTENT (IN) :: jd
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (OUT) :: x
! ..
    x = julian_to_date(jd)
    wd = date_to_weekday_number(x)
    ddd = date_to_day_in_year(x)

  END SUBROUTINE julian_to_date_and_week_and_day


  FUNCTION calendar_to_julian(x) RESULT (ival)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: ival
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: x
! ..
! date routine calendar_to_julian converts date to 
! julian date.  see cacm 1968 11(10):657, 
! letter to the
! editor by henry f. fliegel and 
! thomas c. van flandern.
! example calendar_to_julian(1970, 1, 1) = 2440588
    ival = x%day - 32075 &
      + 1461*(x%year+4800+(x%month-14)/12)/4 + &
      367*(x%month-2-((x%month-14)/12)*12)/12 &
      - 3*((x%year+4900+(x%month-14)/ &
      12)/100)/4

  END FUNCTION calendar_to_julian


  FUNCTION ndays(date1,date2)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: ndays
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: date1, date2
! ..
! dates; that is  mm1/dd1/yyyy1 minus 
! mm2/dd2/yyyy2,
! where datei and datej have elements mm, dd, yyyy.
! ndays will be positive iff 
! date1 is more recent than date2.
    ndays = calendar_to_julian(date1) &
      - calendar_to_julian(date2)

  END FUNCTION ndays

  SUBROUTINE date_stamp(string,want_day,short)
! Returns the current date as a character string
! e.g.
! want_day     short      string
! .TRUE.      .TRUE.      Thursday, 23 Dec 1999
! .TRUE.      .FALSE.     Thursday, 23 December 1999  
!  <- defaul/
! .FALSE.     .TRUE.      23 Dec 1999
! .FALSE.     .FALSE.     23 December 1999
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Scalar Arguments ..
    LOGICAL, OPTIONAL, INTENT (IN) :: short, want_day
    CHARACTER (*), INTENT (OUT) :: string
! ..
! .. Local Scalars ..
    INTEGER :: pos
    LOGICAL :: sh, want_d
! ..
! .. Local Arrays ..
    INTEGER :: val(8)
    CHARACTER (9) :: day(0:6) = (/ 'Sunday   ' &
                                 , 'Monday   ' &
                                 , 'Tuesday  ' &
                                 ,  'Wednesday' &
                                 , 'Thursday ' &
                                 , 'Friday   ' &
                                 , 'Saturday '/)
    CHARACTER (9) :: month(1:12) = &
       (/ 'January  ' & 
        , 'February ' &
         , 'March    ' &
         , 'April    ' &
         , 'May      ' &
         , 'June     ' &
         , 'July     ' &
         , 'August   ' &
         , 'September' &
         , 'October  ' &
         , 'November ' &
         , 'December '/)
! ..
! .. Intrinsic Functions ..
    INTRINSIC date_and_time, len_trim, present, trim
! ..
! .. Local Structures ..
    TYPE (date) :: x
! ..
    want_d = .TRUE.
    IF (present(want_day)) want_d = want_day
    sh = .FALSE.
    IF (present(short)) sh = short

    CALL date_and_time(values=val)

    x = date_(val(3),val(2),val(1))

    IF (want_d) THEN
      pos = date_to_weekday_number(x)
      string = trim(day(pos)) // ','
      pos = len_trim(string) + 2
    ELSE
      pos = 1
      string = ' '
    END IF

    WRITE (string(pos:pos+1),'(i2)') val(3)
    IF (sh) THEN
      string(pos+3:pos+5) = month(val(2)) (1:3)
      pos = pos + 7
    ELSE
      string(pos+3:) = month(val(2))
      pos = len_trim(string) + 2
    END IF

    WRITE (string(pos:pos+3),'(i4)') val(1)

    RETURN
  END SUBROUTINE date_stamp

  FUNCTION date_(dd,mm,yyyy) RESULT (x)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    TYPE (date) :: x
! ..
! .. Scalar Arguments ..
    INTEGER, INTENT (IN) :: dd, mm, yyyy
! ..
    x = date(dd,mm,yyyy)
  END FUNCTION date_

  FUNCTION get_year(x)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: get_year
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: x
! ..
    get_year = x%year
  END FUNCTION get_year

  FUNCTION get_month(x)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: get_month
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: x
! ..
    get_month = x%month
  END FUNCTION get_month

  FUNCTION get_day(x)
! .. Implicit None Statement ..
    IMPLICIT NONE
! ..
! .. Function Return Value ..
    INTEGER :: get_day
! ..
! .. Structure Arguments ..
    TYPE (date), INTENT (IN) :: x
! ..
    get_day = x%day
  END FUNCTION get_day


END MODULE date_module


PROGRAM ch2611
! .. Use Statements ..
  USE date_module, ONLY : calendar_to_julian, &
    date, date_, &
    date_stamp, &
    date_to_day_in_year, &
    date_to_weekday_number, &
    get_day, &
    get_month, &
    get_year, &
    julian_to_date_and_week_and_day, &
    ndays, &
    year_and_day_to_date
! ..
! .. Implicit None Statement ..
  IMPLICIT NONE
! ..
! .. Local Scalars ..
  INTEGER :: dd, ddd, i, mm, ndiff, wd, yyyy
  CHARACTER (50) :: message
! ..
! .. Local Arrays ..
  INTEGER :: val(8)
! ..
! .. Intrinsic Functions ..
! compute date this year for changing clocks 
! back to est.
! i.e.compute date for the last 
! sunday in october for this year.
  INTRINSIC date_and_time
! ..
! .. Local Structures ..
  TYPE (date) :: date1, date2, x
! ..
! Test date_stamp
  message = ' date_stamp = '
  CALL date_stamp(message(15:))
  WRITE (*,'(a)') message
  message = ' date_stamp = '
  CALL date_stamp(message(15:),want_day=.FALSE.)
  WRITE (*,'(a)') message
  message = ' date_stamp = '
  CALL date_stamp(message(15:),short=.TRUE.)
  WRITE (*,'(a)') message
  message = ' date_stamp = '
  CALL date_stamp &
    (message(15:),want_day=.FALSE.,short=.TRUE.)
  WRITE (*,'(a)') message

  CALL date_and_time(values=val)

  yyyy = val(1)
  mm = 10

  DO i = 31, 26, -1
    x = date_(i,mm,yyyy)
    IF (date_to_weekday_number(x)==0) THEN
      PRINT *, 'turn clocks back to est on: '
      print *, i, ' october ', get_year(x)
      EXIT
    END IF
  END DO

! compute date this year for 
! turning clocks ahead to dst
! i.e., compute date for the first 
! sunday in april for this year.

  CALL date_and_time(values=val)

  yyyy = val(1)
  mm = 4

  DO i = 1, 8
    x = date_(i,mm,yyyy)
    IF (date_to_weekday_number(x)==0) THEN
      PRINT *, 'turn clocks ahead to dst on: '
      print *, i, ' april ', get_year(x)
      EXIT
    END IF
  END DO

  CALL date_and_time(values=val)

  yyyy = val(1)
  mm = 12
  dd = 31
  x = date_(dd,mm,yyyy)

!  is this a leap year? i.e., is 
!  12/31/yyyy the 366th day of the year?

  IF (date_to_day_in_year(x)==366) THEN
    PRINT *, get_year(x), ' is a leap year'
  ELSE
    PRINT *, get_year(x), ' is not a leap year'
  END IF

  x = date_(1,1,1970)

  CALL julian_to_date_and_week_and_day &
    (calendar_to_julian(x),x,wd,ddd)

  IF (get_year(x)/=1970 .OR. &
    get_month(x)/=1 .OR. &
    get_day(x)/=1 .OR. &
    wd/=4 .OR. ddd/=1) THEN
    PRINT *, 'julian_to_date_and_week_and_day failed'
    print *,' date, wd, ddd = ', &
    get_year(x), get_month(x), get_day(x), wd, ddd
    STOP
  END IF

!  difference between to same 
!  months and days over 1 leap year is 366.

  date1 = date_(22,5,1984)
  date2 = date_(22,5,1983)
  ndiff = ndays(date1,date2)
  yyyy = 1970
  x = year_and_day_to_date(yyyy,ddd)

  IF (ndiff/=366) THEN
    PRINT *, 'ndays failed; ndiff = ', ndiff
  ELSE
!   recover month and day 
!   from year and day number.
    IF (get_month(x)/=1 .AND. get_day(x)/=1) THEN
      PRINT *, 'year_and_day_to_date failed'
      print *,' mma, dda = ', get_month(x), &
        get_day(x)
    ELSE
      PRINT *, '** date manipulation subroutines'
      print *, '** simple test ok.'
    END IF
  END IF


END PROGRAM ch2611