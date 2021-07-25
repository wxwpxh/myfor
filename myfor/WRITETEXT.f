      PROGRAM WRITETEXT
      DOUBLE PRECISION A(6,6),B(6,6)
      INTEGER I,J
          INTEGER NE
          parameter (NE = 6)

C     text file
      DO 10 I=1,NE
            DO 10 J=1,NE
                  A(I,J)=I+J
   10 CONTINUE
      OPEN(6,FILE='State.txt',STATUS='UNKNOWN')
      WRITE(6,100) ((A(I,J),J=1,6),I=1,6)
      CLOSE(6)
      OPEN(6,FILE='State.txt',status='OLD',ACCESS='SEQUENTIAL')
100   FORMAT(6(E16.9,1X))

C     real text file to array
      I=0
   15 I=I+1
      READ(6,200) (B(I,J),J=1,6)
      IF (I.LT.6) GOTO 15
200   FORMAT(6(E16.9,1X))
c     binary file rw

      END
