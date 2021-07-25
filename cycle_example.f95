! gfortran -o cycle_example cycle_example.f95
program cycle_example     
implicit none      

   integer :: i     
   
   do i = 1, 20          
   
      if (i == 5) then 
         cycle          
      end if         
      
   print*, i      
   end do  
   
end program cycle_example
