C ************** 
C STRING FUNCTIONS 
C **************
      PROGRAM STRINGFN
      WRITE(*,*) LEN("DOG")
      WRITE(*,*) LEN("ELEPHANT")
      WRITE(*,*) LGE("DOG","ELEPHANT")
      WRITE(*,*) LGT("DOG","ELEPHANT")
      WRITE(*,*) LLE("DOG","ELEPHANT")
      WRITE(*,*) LLT("DOG","ELEPHANT")
      WRITE(*,*) LGE("DOG","DOG")
      WRITE(*,*) LGT("DOG","DOG")
      WRITE(*,*) LLE("DOG","DOG")
      WRITE(*,*) LLT("DOG","DOG")
      STOP
      END
