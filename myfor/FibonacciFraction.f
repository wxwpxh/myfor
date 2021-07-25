C	f77 FibonacciFraction.f -o FibonacciFraction
C	gfortran FibonacciFraction.f -o FibonacciFraction
C	f95 FibonacciFraction.f -o FibonacciFraction
	DOUBLE PRECISION A, B, C, S
	S=0.0D0
	A=1.0D0
	B=1.0D0
	C=A+B
	DO 10, I=1, 20, 1
		S=S+C/B
		A=B
		B=C
		C=A+B
10	CONTINUE
	PRINT *, 'S=', S
	END 
