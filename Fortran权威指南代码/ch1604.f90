PROGRAM ch1604
IMPLICIT NONE
!
! Simple counting of vowels, consonants, 
! digits, blanks and the rest
!
INTEGER :: Vowels=0 , Consonants=0, Digits=0
INTEGER :: Blank=0, Other=0, I
CHARACTER :: Letter
CHARACTER (LEN=80) :: Line
  READ '(A)', Line
  DO I=1,80
    Letter=Line(I:I) 
! the above extracts one character at position I
    SELECT CASE (Letter)
      CASE ('A','E','I','O','U', &
           'a','e','i','o','u')
        Vowels=Vowels + 1
      CASE ('B','C','D','F','G','H', &
            'J','K','L','M','N','P', &
            'Q','R','S','T','V','W', &
            'X','Y','Z',           &
            'b','c','d','f','g','h', &
            'j','k','l','m','n','p', &
            'q','r','s','t','v','w', &
            'x','y','z')
        Consonants=Consonants + 1
      CASE ('1','2','3','4','5','6','7','8','9','0')
        Digits=Digits + 1
      CASE (' ')
        Blank=Blank + 1
      CASE DEFAULT
        Other=Other+1
    END SELECT
  END DO
  PRINT *, ' Vowels =  ', Vowels
  PRINT *, ' Consonants =  ', Consonants 
  PRINT *, ' Digits = ', Digits
  PRINT *, ' Blanks = ',Blank
  PRINT *, ' Other characters = ', Other 
END PROGRAM ch1604


