C Payroll with overtime
      PROGRAM PAYROLL
      print *, "RATE, HOURS:"
      READ (*, *) RATE, HOURS
      IF (HOURS .GT. 40.0) THEN
        REGPAY=RATE*40.0
        OVTPAY=1.5*RATE*(HOURS-40.0)
      ELSE
        REGPAY=RATE*HOURS
        OVTPAY=0.0
      END IF
      PAY=REGPAY+OVTPAY
      PRINT *, 'RATE=', RATE, 'HOURS=', HOURS
      PRINT *, 'REGULAR PAY=', REGPAY, ' OVERTIME PAY=', OVTPAY
      PRINT *, 'TOTAL PAY=', PAY
      END
