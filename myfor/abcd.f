         program main
         integer A,B,C,D,E
         do A=1,9,1
                   do B=0,9,1
                            do C=0,9,1
                                     do D=0,9,1
                                               do E=0,9,1
                                               if((10000*A+1000*B+100*C+10*D+E)*4 .eq.(10000*E+1000*D+100*C+10*B+A)) then
                                               write(*,100)A,B,C,D,E
                                               endif
                                               end do
                                     end do
                            end do
                   end do
         end do
100  format(1x,'A=',I2,1x,'B=',I2,1x,'C=',I2,1x,'D=',I2,1x,'E=',I2)
         End

 
