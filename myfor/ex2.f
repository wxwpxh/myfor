C f77 ex2.f -o ex2
C gfortran ex2.f -o ex2
C MAIN PROGRAM
	PROGRAM EX2
	PRINT *, 'radius=', 1.0, ' Circumference=', Circumference(1.0)
	PRINT *, 'radius=', 3.0, ' Circumference=', Circumference(3.0)
	PRINT *, 'radius=', 12.0, ' Circumference=', Circumference(12.0)
	PRINT *, 'radius=', 5.0, ' Circumference=', Circumference(5.0)
	END

C SUBPROGRAM
	FUNCTION Circumference(R)
	PI=3.1415926
	Circumference=2*PI*R
	RETURN
	END
