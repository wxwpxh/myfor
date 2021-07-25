      program nameaddr
      CHARACTER NAME*10, ADDR*20, LINE*50
      READ *, NAME, ADDR
      LINE='MR.'//NAME//'ADDRESS:'//ADDR
      PRINT *, LINE
      END
