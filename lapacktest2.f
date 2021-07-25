! gfortran -o lapacktest2 lapacktest2.f  -llapack -lrefblas      
      program Console1
      external dgesv
      integer n, lda, nrhs, ldb
      parameter (n=2,lda=2,nrhs=1,ldb=2)
      double precision A(lda,n)
      double precision b(ldb,nrhs)
      character byebye
      integer ipiv(n), info, i, j
      A(1,1)=1
      A(1,2)=2
      A(2,1)=3
      A(2,2)=4
      B(1,1)=5
      B(2,1)=6
      write(*,*) 'Hello World'
      call dgesv(n,nrhs,A,lda,ipiv,b,ldb,info)
      write(*,*) 'INFO =', info
      write(*,*) ((A(i,j),i=1,lda),j=1,n)
      write(*,*) ((B(i,j),i=1,ldb),j=1,nrhs)
      write(*,*) "END OF PROGRAM..."
      end program Console1