C **********************
C DO LOOP  2
C next piece of code the step size is 2 (placed after the 1 and the 5).
C In this code J takes the values 1, 3, 5. 
C **********************
      PROGRAM DO2LOOP
      INTEGER J
      DO 10 J=1,5,2
      WRITE(*,*) J*J
 10   CONTINUE
      STOP
      END
