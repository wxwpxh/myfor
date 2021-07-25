      SUBROUTINE OBACT(Todo)
      IMPLICIT NONE
C*** Start of declarations inserted by SPAG
      INTEGER act , LENgth , NCHar
C*** End of declarations inserted by SPAG
      INTEGER Todo , DONe , BASE
      COMMON /EG1   / NCHar , LENgth , DONe
      PARAMETER (BASE=10)
 100  IF ( Todo.NE.0 ) THEN
         act = MOD(Todo,BASE)
         Todo = Todo/BASE
         IF ( act.EQ.1 .OR. act.EQ.4 .OR.
     &        act.EQ.7 .OR. act.EQ.8 .OR.
     &        act.EQ.9 ) THEN
            CALL BADACT(act)
            GOTO 200
         ELSEIF ( act.EQ.2 ) THEN
            CALL COPY
            LENgth = LENgth + NCHar
         ELSEIF ( act.EQ.3 ) THEN
            CALL MOVE
         ELSEIF ( act.EQ.5 ) THEN
            NCHar = -NCHar
            CALL DELETE
            LENgth = LENgth + NCHar
         ELSEIF ( act.EQ.6 ) THEN
            CALL PRINT
         ELSE
            GOTO 100
         ENDIF
         DONe = DONe + 1
         CALL RESYNC
         GOTO 100
      ENDIF
 200  RETURN
      END


