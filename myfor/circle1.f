      program circle
      real r, area, pi
      parameter (pi = 3.14159)

c This program reads a real number r and prints
c the area of a circle with radius r.

      write (*,*) 'Give radius r:'
      read  (*,*) r
      area = pi*r*r
      write (*,*) 'Area = ', area

      stop
      end
