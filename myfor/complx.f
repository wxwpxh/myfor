C *********** 
C COMPLEX 
C ***********
      PROGRAM COMPLX 
C CMPLX and DCMPLX: creates a complex number 
C  from its real and imaginary parts 
C  CMPLX is for single precision  
C  DCMPLX is for double precision
      WRITE(*,*) CMPLX(3,4)
      WRITE(*,*) DCMPLX(3,4)
C CMPLX and DCMPLX can convert a real number in real type 
C  to a real number in single or double precision complex type
      WRITE(*,*) CMPLX(3)
      WRITE(*,*) DCMPLX(3)
C REAL, DBLE: real part of a complex number 
C  REAL-single precision, DBLE-double precision
      WRITE(*,*) REAL(CMPLX(3,4))
      WRITE(*,*) DBLE(DCMPLX(3,4))
C IMAG, DIMAG: imaginary part of a complex number 
C  IMAG-single precision, DIMAG-double precision
      WRITE(*,*) AIMAG(CMPLX(3,4))
      WRITE(*,*) DIMAG(DCMPLX(3,4))
C CONJG : the complex conjugate
      WRITE(*,*) CONJG(CMPLX(3,4))
      WRITE(*,*) CONJG(DCMPLX(3,4))
      STOP
      END
