program test
      !$OMP PARALLEL
      print*, 'ok!'
      !$OMP END PARALLEL
End program
