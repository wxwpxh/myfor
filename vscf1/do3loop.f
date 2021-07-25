C **********************
C DO LOOP 3
C next piece of code the step size is 0.5
C In this code X takes the values 1,1.5,2,2.5,3,3.5,4,4.5,5. 
C **********************
      PROGRAM DO3LOOP
      REAL X
      DO 10 X=1.0,5,0.5
      WRITE(*,*) X*X
 10   CONTINUE
      STOP
      END 
