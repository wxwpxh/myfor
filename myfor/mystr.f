      program mystr
      character*20 c
      character*20 string
      character*5 b
          
      c = "That's right."
      b = "right"  
      PRINT *,LEN(c)
      string="Good morning."
      write(*,*) string
      PRINT *,LGE(c,string)
      PRINT *,LGT(c,string)
      PRINT *,LLE(c,string)
      PRINT *,LLT(c,string)
      PRINT *,INDEX(c,b)          
      end
