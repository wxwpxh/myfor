        SUBROUTINE ABINT(A,N,B,EPS,X,L,P,JS,R,E)
        DIMENSION A(N,N),B(N),X(N),JS(N),P(N,N),R(N),E(N)
        DOUBLE PRECISION A,B,X,P,R,E,Q,QQ
        I=60
        DO 10 K=1,N
        DO 10 J=1,N
10      P(K,J)=A(K,J)
        DO 20 K=1,N
20      E(K)=B(K)
        CALL AGAUS(P,E,N,X,L,JS)
        IF (L.EQ.0) RETURN
5       IF (I.EQ.0) THEN
          L=0
          RETURN
        END IF
        I=I-1
        CALL BRMUL(A,X,N,N,1,E)
        DO 30 K=1,N
30      R(K)=B(K)-E(K)
        DO 40 K=1,N
        DO 40 J=1,N
40      P(K,J)=A(K,J)
        CALL AGAUS(P,R,N,E,L,JS)
        IF (L.EQ.0) RETURN
        Q=0.0
        DO 50 K=1,N
          QQ=ABS(E(K))/(1.0+ABS(X(K)+E(K)))
          IF (QQ.GT.Q) Q=QQ
50      CONTINUE
        DO 60 K=1,N
60      X(K)=E(K)+X(K)
        IF (Q.GE.EPS) GOTO 5
        RETURN
        END
