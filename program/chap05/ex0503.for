	PROGRAM ex0503
	IMPLICIT NONE
	INTEGER rain, windspeed

	WRITE(*,*) "Rain:"
	READ (*,*) rain
	WRITE(*,*) "Wind Speed:"
	READ (*,*) windspeed

	IF ( rain .GT. 150 .OR. windspeed .GT. 10 ) THEN
	  WRITE(*,*) "���ΤW�Z�W��"
	ELSE
	  WRITE(*,*) "�ӱ`�W�Z�W��"
	END IF

	STOP
	END