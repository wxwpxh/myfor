      SUBROUTINE OBACT(Todo)
      IMPLICIT NONE
C*** Start of declarations inserted by SPAG
      INTEGER act , LENgth , NCHar
C*** End of declarations inserted by SPAG
      INTEGER Todo , DONe , BASE
      COMMON /EG1   / NCHar , LENgth , DONe
      PARAMETER (BASE=10)
      DO WHILE ( Todo.NE.0 )
         act = MOD(Todo,BASE)
         Todo = Todo/BASE
         SELECT CASE (act)
         CASE (1,4,7,8,9)
            CALL BADACT(act)
            EXIT
         CASE (2)
            CALL COPY
            LENgth = LENgth + NCHar
         CASE (3)
            CALL MOVE
         CASE (5)
            NCHar = -NCHar
            CALL DELETE
            LENgth = LENgth + NCHar
         CASE (6)
            CALL PRINT
         CASE DEFAULT
            CYCLE
         END SELECT
         DONe = DONe + 1
         CALL RESYNC
      ENDDO
      RETURN
      END


