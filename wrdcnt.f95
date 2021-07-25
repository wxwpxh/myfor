PROGRAM word_count 
!-----------------------------------------------------------------------------!
! Counts the number of "words" contained in a file. The words are assumed to  ! 
! be terminated by any one of:                                                ! 
! space,comma,period,!,?, or the EoR                                          ! 
! The file may have records of any length and the file may contain any number ! 
! of records.                                                                 ! 
! The program prompts for the name of the file to be subject to a word count  ! 
! and the result is written to the default output unit                        ! 
!-----------------------------------------------------------------------------! 
USE ISO_VARYING_STRING 
IMPLICIT NONE
type(VARYING_STRING) :: line,fname
INTEGER              :: ierr,nd,wcount=0 
fname = "initial string"
WRITE(*,ADVANCE='NO',FMT='(A)') " Input name of file?" 
CALL GET(STRING=fname) ! read the required filename from the default 
                     ! input unit assumed to be the whole of the record read
OPEN(UNIT=10,FILE=CHAR(fname))  ! CHAR(fname) converts to the type 
                               ! required by FILE= specifier 
file_read: DO  ! until EoF reached 
  CALL GET(10,line,IOSTAT=ierr)  ! read next line of file 
  IF(ierr == -1 .OR. ierr > 0 )EXIT file_read
  word_scan: DO ! until end of line 
    nd=SCAN(line," ,.!?")  ! scan to find end of word 
    IF(nd == 0)THEN  ! EoR is end of word 
      nd = LEN(line)
      EXIT word_scan 
    ENDIF 
    IF(nd > 1) wcount=wcount+1  ! at least one non-terminator character 
                                ! in the word 
    line = REMOVE(line,1,nd)  ! strips the counted word and its terminator 
                            ! from the line reducing its length before 
                            ! rescanning for the next word 
  ENDDO word_scan 
  IF(nd > 0) wcount=wcount+1 
ENDDO file_read 
IF(ierr < 0)THEN 
  WRITE(*,*) "No. of words in file =",wcount 
ELSEIF(ierr > 0)THEN 
  WRITE(*,*) "Error in GET file in word_count, No. ",ierr 
ENDIF 
ENDPROGRAM word_count 
