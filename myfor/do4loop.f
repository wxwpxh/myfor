C **********************
C DO LOOP 4
C (The step size in a loop does not have to be positive).step size is -1 
C In this code J takes the values 4, 3, 4.
C **********************
      PROGRAM DO4LOOP
      INTEGER J
      DO 10 J=4,2,-1
      WRITE(*,*) J*J
 10   CONTINUE
      STOP
      END
