      program main
      REAL A,B,C
      COMMON / / A,B,C

      INTEGER U,V,W
      COMMON /UVWCB/ U,V,W

      DOUBLE PRECISION X,Y,Z
      COMMON /XYZCB/ X,Y,Z

      A = 1.0
      B = 2.0
      C = 3.0

      WRITE (6,'(3(F6.3, 5X))') A,B,C
      WRITE (6,'(3(I6,   5X))') U,V,W
      WRITE (6,'(1P3E11.3E3)')  X,Y,Z

      END

****************************************

      BLOCK DATA BDXYZ

      DOUBLE PRECISION X,Y,Z
      COMMON /XYZCB/ X,Y,Z

      DATA X,Y,Z / 1.1111111111111111D+100,
     X             2.2222222222222222D+200,
     X             3.3333333333333333D+300 /

      END

****************************************

      BLOCK DATA

      INTEGER U,V,W
      COMMON /UVWCB/ U,V,W

      DATA U,V,W / 123456, 234567, 345678 /

      END
