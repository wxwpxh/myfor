C Subroutines demo
      PROGRAM SUBDEMO
      REAL*4 ALENGTH, AWIDTH, ANAREA
      ALENGTH=3.0
      AWIDTH=2.0
      CALL RECAREA(ALENGTH,AWIDTH,ANAREA)
      WRITE(*,*) 'AREA= ',ANAREA
      END 
 
C Subroutine RECAREA returns the area of a rectangle C  given its length and width
      SUBROUTINE RECAREA(LENGTH,WIDTH,AREA)
      REAL*4 LENGTH,WIDTH,AREA
      AREA=LENGTH*WIDTH
      END
