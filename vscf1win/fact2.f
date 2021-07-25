C     k!
      PROGRAM fact2
      integer n,k,fact
      fact=1
      print *, "input an integer!"
      read *,k
      do 10,n=1,k,1
         fact=fact*n
 10   continue
      print *,fact
      end