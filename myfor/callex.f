      program callex
      integer m, n
C
      m = 13
      n = 2

      call iswap(m, n)
      write(*,*) m, n

      stop
      end


      subroutine iswap (a, b)
      integer a, b
C Local variables
      integer tmp

      tmp = a
      a = b
      b = tmp
      return
      end
