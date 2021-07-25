program kindSpecifier
implicit none

   real(kind = 4) :: a, b, c
   real(kind = 8) :: e, f, g
   integer(kind = 2) :: i, j, k
   integer(kind = 4) :: l, m, n
   integer :: kind_a, kind_i, kind_e, kind_l
   
   kind_a = kind(a)
   kind_i = kind(i)
   kind_e = kind(e)
   kind_l = kind(l)
   
   print *,'default kind for real is', kind_a
   print *,'default kind for int is', kind_i
   print *,'extended kind for real is', kind_e
   print *,'default kind for int is', kind_l
   
end program kindSpecifier
