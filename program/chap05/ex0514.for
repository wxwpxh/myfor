	PROGRAM ex0514
	IMPLICIT NONE
	REAL height ! �O������
	REAL weight ! �O���魫

	WRITE(*,*) "height:"
	READ(*,*)   height     ! Ū�J����
	WRITE(*,*) "weight:"
	READ(*,*)   weight     ! Ū�J�魫
	
	IF ( weight > height-100 ) GOTO 200
	! �W��������, �S������200�~�|����o��
100	WRITE(*,*) "Under control." 
	GOTO 300  ! �U�@�椣�����ҥH�n����300.
200   WRITE(*,*) "Too fat!"
	
300	STOP
	END