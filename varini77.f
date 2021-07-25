C     variable initialization
      PROGRAM MAIN
      REAL time
          CHARACTER*(80)  string
          DATA time,STRING/10.0,'GOOD GOOD STUDY,DAY DAY UP!'/
      WRITE (*,*) 'Time = ', time
          WRITE (*,*) STRING(1:76)
      END
