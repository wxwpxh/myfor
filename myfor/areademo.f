C Functions demo
      PROGRAM AREADEMO
      REAL*4 ALENGTH, AWIDTH
      ALENGTH=3.0
      AWIDTH=2.0
      WRITE(*,*) 'AREA= ',AREA(ALENGTH,AWIDTH)
      END 
 
C Function RECAREA returns the area of a rectangle 
C  given its length and width
      REAL*4 FUNCTION AREA(LENGTH,WIDTH)
      REAL*4 LENGTH,WIDTH
      AREA=LENGTH*WIDTH
      END
