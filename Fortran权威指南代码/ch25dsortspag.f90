!*==DSORT.f90  processed by SPAG 6.55Dc at 17:45 on  4 May 2005
!*------------------   SPAG Configuration Options   --------------------
!*--0233,12 021101,-1 000000100000031111000002000020110201210,72 111 --
!*--100000000012114110000000000,100,50,20,10 52,99000 12000000000031 --
!*--99011000000000000,72,72 02,42,38,33 00011012110000100000000      --
!*----------------------------------------------------------------------
!DECK DSORT
SUBROUTINE DSORT(Dx,Dy,N,Kflag)
IMPLICIT NONE
!*--DSORT10
!***BEGIN PROLOGUE  DSORT
!***PURPOSE  Sort an array and optionally make the same interchanges in
!            an auxiliary array.  The array may be sorted in increasing
!            or decreasing order.  A slightly modified QUICKSORT
!            algorithm is used.
!***LIBRARY   SLATEC
!***CATEGORY  N6A2B
!***TYPE      REAL (SSORT-S, DSORT-D, ISORT-I)
!***KEYWORDS  SINGLETON QUICKSORT, SORT, SORTING
!***AUTHOR  Jones, R. E., (SNLA)
!           Wisniewski, J. A., (SNLA)
!***DESCRIPTION
!
!   DSORT sorts array DX and optionally makes the same interchanges in
!   array DY.  The array DX may be sorted in increasing order or
!   decreasing order.  A slightly modified quicksort algorithm is used.
!
!   Description of Parameters
!      DX - array of values to be sorted   (usually abscissas)
!      DY - array to be (optionally) carried along
!      N  - number of values in array DX to be sorted
!      KFLAG - control parameter
!            =  2  means sort DX in increasing order and carry DY along.
!            =  1  means sort DX in increasing order (ignoring DY)
!            = -1  means sort DX in decreasing order (ignoring DY)
!            = -2  means sort DX in decreasing order and carry DY along.
!
!***REFERENCES  R. C. Singleton, Algorithm 347, An efficient algorithm
!                 for sorting with minimal storage, Communications of
!                 the ACM, 12, 3 (1969), pp. 185-187.
!***ROUTINES CALLED  XERMSG
!***REVISION HISTORY  (YYMMDD)
!   761101  DATE WRITTEN
!   761118  Modified to use the Singleton quicksort algorithm.  (JAW)
!   890531  Changed all specific intrinsics to generic.  (WRB)
!   890831  Modified array declarations.  (WRB)
!   891009  Removed unreferenced statement labels.  (WRB)
!   891024  Changed category.  (WRB)
!   891024  REVISION DATE from Version 3.2
!   891214  Prologue converted to Version 4.0 format.  (BAB)
!   900315  CALLs to XERROR changed to CALLs to XERMSG.  (THJ)
!   901012  Declared all variables; changed X,Y to DX,DY; changed
!           code to parallel SSORT. (M. McClain)
!   920501  Reformatted the REFERENCES section.  (DWL, WRB)
!   920519  Clarified error messages.  (DWL)
!   920801  Declarations section rebuilt and code restructured to use
!           IF-THEN-ELSE-ENDIF.  (RWC, WRB)
!***END PROLOGUE  DSORT
!     .. Scalar Arguments ..
INTEGER Kflag , N
!     .. Array Arguments ..
REAL Dx(*) , Dy(*)
!     .. Local Scalars ..
REAL r , t , tt , tty , ty
INTEGER i , ij , j , k , kk , l , m , nn
!     .. Local Arrays ..
INTEGER il(21) , iu(21)
!     .. External Subroutines ..
!      EXTERNAL XERMSG
!     .. Intrinsic Functions ..
INTRINSIC ABS , INT
  CALL SB$ENT('DSORT','D:\document\f2003\examples\ch25\polyhedron\dsort.f'&
  & )
!***FIRST EXECUTABLE STATEMENT  DSORT
  CALL BL$ENT(65)
  nn = N
  IF ( nn<1 ) THEN
!         CALL XERMSG ('SLATEC', 'DSORT',
!     +      'The number of values to be sorted is not positive.', 1, 1)
   CALL BL$ENT(69)
   CALL SB$EXI
   RETURN
  ENDIF
!
  CALL BL$ENT(72)
  kk = ABS(Kflag)
  IF ( kk/=1 .AND. kk/=2 ) THEN
!         CALL XERMSG ('SLATEC', 'DSORT',
!     +      'The sort control parameter, K, is not 2, 1, -1, or -2.', 2,
!     +      1)
   CALL BL$ENT(77)
   CALL SB$EXI
   RETURN
  ENDIF
!
!     Alter array DX to get decreasing order if needed
!
  CALL BL$ENT(82)
  IF ( Kflag<=-1 ) THEN
   CALL BL$ENT(83)
   DO i = 1 , nn
     CALL BL$ENT(84)
     Dx(i) = -Dx(i)
   ENDDO
  ENDIF
!
  CALL BL$ENT(88)
  IF ( kk==2 ) GOTO 900
!
!     Sort DX only
!
  CALL BL$ENT(92)
  m = 1
  i = 1
  j = nn
  r = 0.375D0
!
   100  CALL BL$ENT(97)
       IF ( i==j ) GOTO 500
  CALL BL$ENT(98)
  IF ( r<=0.5898437D0 ) THEN
   CALL BL$ENT(99)
   r = r + 3.90625D-2
  ELSE
   CALL BL$ENT(101)
   r = r - 0.21875D0
  ENDIF
!
   200  CALL BL$ENT(104)
       k = i
!
!     Select a central element of the array and save it in location T
!
  ij = i + INT((j-i)*r)
  t = Dx(ij)
!
!     If first element of array is greater than T, interchange with T
!
  IF ( Dx(i)>t ) THEN
   CALL BL$ENT(114)
   Dx(ij) = Dx(i)
   Dx(i) = t
   t = Dx(ij)
  ENDIF
  CALL BL$ENT(118)
  l = j
!
!     If last element of array is less than than T, interchange with T
!
  IF ( Dx(j)<t ) THEN
   CALL BL$ENT(123)
   Dx(ij) = Dx(j)
   Dx(j) = t
   t = Dx(ij)
!
!        If first element of array is greater than T, interchange with T
!
   IF ( Dx(i)>t ) THEN
     CALL BL$ENT(130)
     Dx(ij) = Dx(i)
     Dx(i) = t
     t = Dx(ij)
   ENDIF
  ENDIF
!
!     Find an element in the second half of the array which is smaller
!     than T
!
   300  CALL BL$ENT(139)
       l = l - 1
  IF ( Dx(l)>t ) GOTO 300
!
!     Find an element in the first half of the array which is greater
!     than T
!
   400  CALL BL$ENT(145)
       k = k + 1
  IF ( Dx(k)<t ) GOTO 400
!
!     Interchange these elements
!
  CALL BL$ENT(150)
  IF ( k<=l ) THEN
   CALL BL$ENT(151)
   tt = Dx(l)
   Dx(l) = Dx(k)
   Dx(k) = tt
   GOTO 300
  ENDIF
!
!     Save upper and lower subscripts of the array yet to be sorted
!
  CALL BL$ENT(159)
  IF ( l-i>j-k ) THEN
   CALL BL$ENT(160)
   il(m) = i
   iu(m) = l
   i = k
   m = m + 1
  ELSE
   CALL BL$ENT(165)
   il(m) = k
   iu(m) = j
   j = l
   m = m + 1
  ENDIF
  CALL BL$ENT(170)
  GOTO 600
!
!     Begin again on another portion of the unsorted array
!
   500  CALL BL$ENT(174)
       m = m - 1
  IF ( m==0 ) GOTO 1800
  CALL BL$ENT(176)
  i = il(m)
  j = iu(m)
!
   600  CALL BL$ENT(179)
       IF ( j-i>=1 ) GOTO 200
  CALL BL$ENT(180)
  IF ( i==1 ) GOTO 100
  CALL BL$ENT(181)
  i = i - 1
!
   700  CALL BL$ENT(183)
       i = i + 1
  IF ( i==j ) GOTO 500
  CALL BL$ENT(185)
  t = Dx(i+1)
  IF ( Dx(i)<=t ) GOTO 700
  CALL BL$ENT(187)
  k = i
!
   800  CALL BL$ENT(189)
       Dx(k+1) = Dx(k)
  k = k - 1
  IF ( t<Dx(k) ) GOTO 800
  CALL BL$ENT(192)
  Dx(k+1) = t
  GOTO 700
!
!     Sort DX and carry DY along
!
   900  CALL BL$ENT(197)
       m = 1
  i = 1
  j = nn
  r = 0.375D0
!
   1000 CALL BL$ENT(202)
       IF ( i==j ) GOTO 1400
  CALL BL$ENT(203)
  IF ( r<=0.5898437D0 ) THEN
   CALL BL$ENT(204)
   r = r + 3.90625D-2
  ELSE
   CALL BL$ENT(206)
   r = r - 0.21875D0
  ENDIF
!
   1100 CALL BL$ENT(209)
       k = i
!
!     Select a central element of the array and save it in location T
!
  ij = i + INT((j-i)*r)
  t = Dx(ij)
  ty = Dy(ij)
!
!     If first element of array is greater than T, interchange with T
!
  IF ( Dx(i)>t ) THEN
   CALL BL$ENT(220)
   Dx(ij) = Dx(i)
   Dx(i) = t
   t = Dx(ij)
   Dy(ij) = Dy(i)
   Dy(i) = ty
   ty = Dy(ij)
  ENDIF
  CALL BL$ENT(227)
  l = j
!
!     If last element of array is less than T, interchange with T
!
  IF ( Dx(j)<t ) THEN
   CALL BL$ENT(232)
   Dx(ij) = Dx(j)
   Dx(j) = t
   t = Dx(ij)
   Dy(ij) = Dy(j)
   Dy(j) = ty
   ty = Dy(ij)
!
!        If first element of array is greater than T, interchange with T
!
   IF ( Dx(i)>t ) THEN
     CALL BL$ENT(242)
     Dx(ij) = Dx(i)
     Dx(i) = t
     t = Dx(ij)
     Dy(ij) = Dy(i)
     Dy(i) = ty
     ty = Dy(ij)
   ENDIF
  ENDIF
!
!     Find an element in the second half of the array which is smaller
!     than T
!
   1200 CALL BL$ENT(254)
       l = l - 1
  IF ( Dx(l)>t ) GOTO 1200
!
!     Find an element in the first half of the array which is greater
!     than T
!
   1300 CALL BL$ENT(260)
       k = k + 1
  IF ( Dx(k)<t ) GOTO 1300
!
!     Interchange these elements
!
  CALL BL$ENT(265)
  IF ( k<=l ) THEN
   CALL BL$ENT(266)
   tt = Dx(l)
   Dx(l) = Dx(k)
   Dx(k) = tt
   tty = Dy(l)
   Dy(l) = Dy(k)
   Dy(k) = tty
   GOTO 1200
  ENDIF
!
!     Save upper and lower subscripts of the array yet to be sorted
!
  CALL BL$ENT(277)
  IF ( l-i>j-k ) THEN
   CALL BL$ENT(278)
   il(m) = i
   iu(m) = l
   i = k
   m = m + 1
  ELSE
   CALL BL$ENT(283)
   il(m) = k
   iu(m) = j
   j = l
   m = m + 1
  ENDIF
  CALL BL$ENT(288)
  GOTO 1500
!
!     Begin again on another portion of the unsorted array
!
   1400 CALL BL$ENT(292)
       m = m - 1
  IF ( m==0 ) GOTO 1800
  CALL BL$ENT(294)
  i = il(m)
  j = iu(m)
!
   1500 CALL BL$ENT(297)
       IF ( j-i>=1 ) GOTO 1100
  CALL BL$ENT(298)
  IF ( i==1 ) GOTO 1000
  CALL BL$ENT(299)
  i = i - 1
!
   1600 CALL BL$ENT(301)
       i = i + 1
  IF ( i==j ) GOTO 1400
  CALL BL$ENT(303)
  t = Dx(i+1)
  ty = Dy(i+1)
  IF ( Dx(i)<=t ) GOTO 1600
  CALL BL$ENT(306)
  k = i
!
   1700 CALL BL$ENT(308)
       Dx(k+1) = Dx(k)
  Dy(k+1) = Dy(k)
  k = k - 1
  IF ( t<Dx(k) ) GOTO 1700
  CALL BL$ENT(312)
  Dx(k+1) = t
  Dy(k+1) = ty
  GOTO 1600
!
!     Clean up
!
   1800 CALL BL$ENT(318)
       IF ( Kflag<=-1 ) THEN
   CALL BL$ENT(319)
   DO i = 1 , nn
     CALL BL$ENT(320)
     Dx(i) = -Dx(i)
   ENDDO
  ENDIF
  CALL BL$ENT(323)
  CONTINUE
  CALL SB$EXI
  END SUBROUTINE DSORT


